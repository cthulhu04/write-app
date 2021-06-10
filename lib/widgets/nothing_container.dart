import 'package:flutter/material.dart';

class NothingContainer extends StatelessWidget {
  bool setTitle;
  NothingContainer({this.setTitle = false});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: Container(
        alignment: Alignment.center,
        color: setTitle ? Colors.white24 : Colors.white12,
        child: setTitle
            ? Text(
                'nothing',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              )
            : null,
      ),
    );
  }
}
