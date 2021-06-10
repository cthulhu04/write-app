import 'package:flutter/material.dart';

class SaveAndShareButton extends StatefulWidget {
  String title;
  Function buttonFunction;
  bool setToSave;
  SaveAndShareButton({
    required this.title,
    required this.buttonFunction,
    this.setToSave = false,
  });

  @override
  _SaveAndShareButtonState createState() => _SaveAndShareButtonState();
}

class _SaveAndShareButtonState extends State<SaveAndShareButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.buttonFunction(),
      child: Text(
        widget.title,
        style: TextStyle(
          color: widget.setToSave ? Colors.green : Colors.grey,
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

// () {
// if (document.isEmpty) {
// Navigator.pop(context);
// } else {
// documents.setToUpdateDocument(index, document);
// Navigator.pop(context);
// }
// }
