import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPressed;
  const RoundButton(
      {super.key,
        required this.title,
        this.loading = false,
        required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Center(child: loading ? CircularProgressIndicator(color: Colors.white,) : Text(title,style: TextStyle(
            color: Colors.white
        ),)),
      ),
    );
  }
}