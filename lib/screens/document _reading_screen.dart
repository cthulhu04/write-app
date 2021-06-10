import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:write_app/controllers/document_controller.dart';
import 'package:write_app/widgets/widgets.dart';

class DocumentReadingScreen extends StatefulWidget {
  int index;
  DocumentReadingScreen({required this.index});

  @override
  _DocumentReadingScreenState createState() => _DocumentReadingScreenState();
}

class _DocumentReadingScreenState extends State<DocumentReadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Write',
            style: TextStyle(
              fontSize: 23.0,
              color: Colors.black26,
            )),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Center(
              child: SaveAndShareButton(
                title: 'Share',
                buttonFunction: () => print('share'),
              ),
            ),
          )
        ],
      ),
      body: Consumer<DocumentController>(
        builder: (context, documents, child) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  Text(
                    documents.allDocuments[widget.index].document!,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
