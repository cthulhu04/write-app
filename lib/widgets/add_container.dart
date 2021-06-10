import 'package:flutter/material.dart';
import 'package:write_app/config/config.dart';

class AddContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(12.0),
        alignment: Alignment.center,
        color: Colors.white24,
        child: Icon(
          Icons.add,
          size: 60.0,
          color: Colors.grey[400],
        ),
      ),
      onTap: () => Navigator.of(context).pushNamed(Config.newDocument),
    );
  }
}
