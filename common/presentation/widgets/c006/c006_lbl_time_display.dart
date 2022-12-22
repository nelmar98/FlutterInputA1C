import 'package:flutter/material.dart';

class C006LblTimeDisplay extends StatelessWidget {
  const C006LblTimeDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String date = '18:21';
    return Text(
      date,
      style: const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w500,
        color: Colors.white70,
      ),
    );
  }
}
