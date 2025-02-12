import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final String texto_logo;
  const Logo({super.key, required this.texto_logo});

  @override
  Widget build(BuildContext context) {
    return Text(
      texto_logo,
      style: TextStyle(
          fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }
}
