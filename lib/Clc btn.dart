import 'package:flutter/material.dart';

class ClcBtn extends StatelessWidget {
  String txt;

  ClcBtn(this.txt,this.OnclickBtn);
  Function OnclickBtn ;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 7,
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                    side: BorderSide(
                      color: Colors.white,
                      width: 3,
                    ))),
            onPressed: () {
              OnclickBtn(txt);
            },
            child: Text(
              txt,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            )));
  }
}
