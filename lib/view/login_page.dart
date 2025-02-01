import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:login_profile_app/data/models/req/login_model.dart';
import 'package:provider/provider.dart';
import '../res/components/round_button.dart';
import '../utils/utils.dart';
import '../view_model/auth_view_model.dart';
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  TextEditingController _emailControler = TextEditingController();
  TextEditingController _passwordControler = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailControler.dispose();
    _passwordControler.dispose();

    emailFocus.dispose();
    passwordFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);  // important
    return Scaffold(
      appBar: AppBar(title: Text('Login'),centerTitle: true,elevation: 20,),
      body: SafeArea(child:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            controller: _emailControler,
            keyboardType: TextInputType.emailAddress,
            focusNode: emailFocus,  // see carefully
            decoration: InputDecoration(
                hintText: 'Enter Email',
                labelText: 'Email',
                prefixIcon: Icon(Icons.email)
            ),
            onFieldSubmitted: (value) {
              Utils.fieldFocusChange(context, emailFocus, passwordFocus);
            },
          ),
          ValueListenableBuilder(
            valueListenable: _obsecurePassword,
            builder: (context, value, child) {
              return  TextFormField(
                controller: _passwordControler,
                obscureText: _obsecurePassword.value,
                focusNode: passwordFocus,
                decoration: InputDecoration(
                    hintText: 'Enter Password',
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(onPressed: (){
                      _obsecurePassword.value = !_obsecurePassword.value;
                    }, icon: _obsecurePassword.value ? Icon(Icons.visibility_off) : Icon(Icons.visibility))
                ),
              );
            },),

          SizedBox(height: 20,),

          RoundButton(title: 'Button',loading: authViewModel.loading,onPressed: (){
            if(_emailControler.text.isEmpty)
            {
              Utils.snackBarMessage(context, 'Please enter email');
            }
            else if(_passwordControler.text.isEmpty)
            {
              Utils.snackBarMessage(context, 'Please enter password');
            }
            else if(_passwordControler.text.length < 6)
            {
              Utils.snackBarMessage(context, 'Please enter 6 digit password');
            }
            else{
             LoginModel model = LoginModel(
               email: _emailControler.text.trim(),
               password: _passwordControler.text.trim()
             );

              // call view_model for triggering login function
             authViewModel.loginApi(jsonEncode(model.toJson()), context);
              print('API hit');
            }
          },)


        ],
      )),
    );
  }
}