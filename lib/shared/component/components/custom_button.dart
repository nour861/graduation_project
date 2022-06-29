import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  String title;
  VoidCallback? onPress;
  Color? textColor;
  Color? bkColor;

  CustomButton({
    Key? key,
    this.title = '',
    this.onPress,
    this.textColor,
    this.bkColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: bkColor!,
        border: Border.all(color: const Color(0xff22c0e1), width: 2),
        borderRadius: const BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
      child: MaterialButton(
        onPressed: onPress!,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: textColor!,
          ),
        ),
      ),
    );
  }
}
