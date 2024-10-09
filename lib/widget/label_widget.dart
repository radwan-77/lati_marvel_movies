import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LabelWidget extends StatelessWidget {
  final String  label;

  const LabelWidget({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(label,  style: TextStyle(fontSize: 20, color: Colors.blue),),

      ],
    );
  }
}