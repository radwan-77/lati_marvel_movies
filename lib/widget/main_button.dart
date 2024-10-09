import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lati_marvel_movies/helper/consts.dart';

class MainButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool inProgress;
  final Color btnColor;
  final Color txtColor;

  MainButton({
    required this.text,
    required this.onPressed,
    this.inProgress = false,
    this.btnColor = mainColor,
    this.txtColor = secondaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: inProgress ? null : onPressed,
      child: inProgress
          ? CircularProgressIndicator(
              color: txtColor,
            )
          : Text(text),
    );
  }
}
