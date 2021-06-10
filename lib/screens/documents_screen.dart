import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:write_app/controllers/document_controller.dart';
import 'package:write_app/screens/update_document_screen.dart';
import 'package:write_app/widgets/widgets.dart';

class DocumentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DocumentController>(
      builder: (context, documents, child) {
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
                      child: FormFieldText(
                        hintText: 'search',
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
                    if (index == 0) {
                      return AddContainer();
                    }

                    if (documents.allDocuments.isEmpty) {
                      return NothingContainer();
                    }

                    return DocumentContainer(
                      title: documents.allDocuments[index].document!,
                      onPressFunction: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UpdateDocumentScreen(index),
                            ));
                      },
                      longPressFunction: () => documents
                          .deleteDocument(documents.allDocuments[index]),
                    );
                  },
                  childCount: documents.allDocuments.isNotEmpty
                      ? documents.documentCount
                      : 4,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
