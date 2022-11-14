import 'package:flutter/material.dart';

class CustomBottomLevels extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomBottomLevels(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      // padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      margin: const EdgeInsets.only(top: 15),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        // height: 40,
        padding: const EdgeInsets.symmetric(vertical: 13),
        onPressed: onPressed!,
        color: Colors.blue,
        textColor: Colors.white,
        child: Text(
          text,
        ),
      ),
    );
  }
}
