import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:login_profile_app/repository/auth_repository.dart';

import '../utils/routes/route_name.dart';
import '../utils/utils.dart';

class AuthViewModel with ChangeNotifier{
  final _myRepo = AuthRepository();
  // for loading status show on button
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }


  Future<void> loginApi(dynamic data, BuildContext context)async{
    setLoading(true); // when api hit show loading
    _myRepo.loginApi(data).then((value) {
      setLoading(false);
      Utils.snackBarMessage(context, 'Login Successful');
      // successfully login then navigate to homepage
      Navigator.of(context).pushNamed(RoutesName.home);

      if(kDebugMode){
        /*
        I/flutter (19489): print success code
I/flutter (19489): {token: QpwL5tke4Pnpja7X4}
         */
        print('print success code');
        print(value.toString());  // success message
      }

    },).onError((error, stackTrace) {
      setLoading(false);
      Utils.snackBarMessage(context, error.toString());
      if(kDebugMode){
        print(error.toString());  // error message
      }

    },);
  }
}