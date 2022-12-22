import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateDisplay extends StatefulWidget {
  const DateDisplay({Key? key}) : super(key: key);

  @override
  State<DateDisplay> createState() => _DateDisplayState();
}

class _DateDisplayState extends State<DateDisplay> {
  DateTime _datetime = DateTime.now();

//creating separate method for the onPressed
  void _showDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime.now(),
    ).then(
      (value) {
        setState(() {
          _datetime = value!;
        });
      },
    );
  }

  var outlineButtonStyle = OutlinedButton.styleFrom(
    side: const BorderSide(width: 2.0, color: Colors.white),
    foregroundColor: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      color: Colors.grey,
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 10.0,
          ),
          Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 20.0)),
              Text(
                '${_datetime.year.toString()}'
                '${(DateFormat(' MMM').format(_datetime))}',
                style: TextStyle(fontSize: 28.0, color: Colors.white),
              ),
              Text(
                '${DateFormat('dd').format(_datetime)}${DateFormat(' (EE)').format(_datetime)}',
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 30.0, top: 23.0),
            // color: Colors.lightBlue,
            child: Text(DateFormat("HH:mm").format(DateTime.now()),
                style: TextStyle(fontSize: 28.0, color: Colors.white)),
          ),
          SizedBox(
            width: 30.0,
          ),
          Container(
            height: 60.0,
            child: OutlinedButton(
              onPressed: _showDate,
              style: outlineButtonStyle,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.date_range,
                    size: 25.0,
                  ),
                  Text('DATE'),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 3.0,
          ),
          Container(
            height: 60.0,
            child: OutlinedButton(
              onPressed: _showDate,
              style: outlineButtonStyle,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.date_range_outlined,
                    size: 25.0,
                  ),
                  Text('NOW'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
