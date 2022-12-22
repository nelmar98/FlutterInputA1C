import 'package:flutter/material.dart';

class C006BtnPicDatetime extends StatefulWidget {
  const C006BtnPicDatetime({Key? key}) : super(key: key);

  @override
  State<C006BtnPicDatetime> createState() => _C006BtnPicDatetimeState();
}

class _C006BtnPicDatetimeState extends State<C006BtnPicDatetime> {
  var outlineButtonStyle = OutlinedButton.styleFrom(
    side: const BorderSide(width: 3.0, color: Colors.white70),
    foregroundColor: Colors.white70,
  );
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () {},
        style: outlineButtonStyle,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.ac_unit),
              Text('Date'),
            ],
          ),
        )
    );
  }
}
