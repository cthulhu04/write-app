import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialMediaButton extends StatelessWidget {
  final String? text;
  final IconData? fontAwesomeIcons;
  Function? onTap;

  SocialMediaButton({
    @required this.text,
    @required this.fontAwesomeIcons,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        child: Container(
          padding: EdgeInsets.all(12.0),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FaIcon(fontAwesomeIcons),
              SizedBox(width: 3.0),
              Flexible(
                flex: 1,
                child: Text(
                  text!,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
        ),
        onTap: () => onTap,
      ),
    );
  }
}
