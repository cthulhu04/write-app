import 'package:flutter/material.dart';

class DocumentContainer extends StatefulWidget {
  String title;
  Function onPressFunction;
  Function longPressFunction;

  DocumentContainer({
    required this.title,
    required this.onPressFunction,
    required this.longPressFunction,
  });

  @override
  _DocumentContainerState createState() => _DocumentContainerState();
}

class _DocumentContainerState extends State<DocumentContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onPressFunction(),
      onLongPress: () => widget.longPressFunction(),
      child: Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: Text(
          widget.title,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 28.0,
          ),
        ),
      ),
    );
  }
}
