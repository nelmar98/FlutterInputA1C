import 'package:flutter/material.dart';

class C006LblDateDisplay extends StatefulWidget {
  const C006LblDateDisplay({Key? key}) : super(key: key);

  @override
  State<C006LblDateDisplay> createState() => _C006LblDateDisplayState();
}

class _C006LblDateDisplayState extends State<C006LblDateDisplay> {
  @override
  Widget build(BuildContext context) {
    // NOTE : STRING DECLARATIONS FOR STORING VALUES
    String month    = 'Dec. 2022';
    String day      = '5';
    String dayWord  = 'Mon';
    String dispDay  = '   ( $dayWord )';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          month,
          style: const TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.w500,
          ),
        ),
        Row(
          children: [
            Text(
              day,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 30,
              ),
            ),
            Text(
              dispDay,
              style: const TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        )
      ],
    );
  }
}
