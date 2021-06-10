import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:write_app/config/config.dart';
import 'package:write_app/controllers/document_controller.dart';
import 'package:write_app/widgets/widgets.dart';

class NewDocumentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String document = '';
    return Scaffold(
      backgroundColor: Config.mainColor,
      body: SafeArea(
        child: Consumer<DocumentController>(
          builder: (context, documents, child) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SaveAndShareButton(
                        title: 'Save',
                        setToSave: true,
                        buttonFunction: () {
                          if (document.isEmpty) {
                            Navigator.pop(context);
                          } else {
                            documents.writeDocument(document);
                            Navigator.pop(context);
                          }
                        },
                      ),
                      mainLogo(),
                      SaveAndShareButton(
                        title: 'Share',
                        buttonFunction: () => print('share'),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Expanded(
                    flex: 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Container(
                        color: Colors.white,
                        height: 600.0,
                        padding: EdgeInsets.all(10.0),
                        child: TextField(
                          autofocus: true,
                          maxLines: null,
                          expands: true,
                          decoration: InputDecoration(
                            hintText: 'write a document',
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          onChanged: (value) => document = value,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
