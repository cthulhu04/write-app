import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:write_app/controllers/document_controller.dart';
import 'package:write_app/screens/screens.dart';
import 'package:write_app/widgets/widgets.dart';

class ReadNodeScreen extends StatefulWidget {
  const ReadNodeScreen({Key? key}) : super(key: key);

  @override
  _ReadNodeScreenState createState() => _ReadNodeScreenState();
}

class _ReadNodeScreenState extends State<ReadNodeScreen> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<DocumentController>(
      builder: (context, documents, child) {
        int listDocumen() {
          return documents.allDocuments.isEmpty ? 1 : documents.documentCount;
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              const SliverAppBar(
                pinned: false,
                backgroundColor: Colors.transparent,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text('Write'),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: TextField(
                        controller: _textEditingController,
                        decoration: InputDecoration(
                          hintText: 'searching',
                          filled: true,
                          fillColor: Colors.white,
                          border: InputBorder.none,
                        ),
                        onChanged: (value) => documents.searchDocument(value),
                        onTap: () => _textEditingController.clear(),
                      ),
                    );
                  },
                  childCount: 1,
                ),
              ),
              SliverGrid(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200.0,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    //check if the is not document
                    if (documents.allDocuments.isEmpty) {
                      return NothingContainer(setTitle: true);
                    }

                    return DocumentContainer(
                      title: documents.allDocuments[index].document!,
                      onPressFunction: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DocumentReadingScreen(index: index),
                            ));
                      },
                      longPressFunction: () => documents
                          .deleteDocument(documents.allDocuments[index]),
                    );
                  },
                  childCount: listDocumen(),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
