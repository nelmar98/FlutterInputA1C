import 'package:flutter/material.dart';

import '../widgets/c006/c006_btn_pic_now.dart';
import '../widgets/c006/c006_btn_pic_datetime.dart';
import '../widgets/c006/c006_lbl_time_display.dart';
import '../widgets/c006/c006_lbl_date_display.dart';

class C006DateAndTimeForm2 extends StatefulWidget {
  const C006DateAndTimeForm2({Key? key}) : super(key: key);

  @override
  State<C006DateAndTimeForm2> createState() => _C006DateAndTimeForm2State();
}

class _C006DateAndTimeForm2State extends State<C006DateAndTimeForm2> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 109,
      color: const Color.fromRGBO(97, 97, 97, 1),
      padding: const EdgeInsets.symmetric(vertical:25, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
              child: C006LblDateDisplay(),
          ),
          const Expanded(
            child: C006LblTimeDisplay(),
          ),
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.5),
                child: C006BtnPicDatetime(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.5),
                child: C006BtnPicNow(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
