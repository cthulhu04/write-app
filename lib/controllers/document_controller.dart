import 'package:flutter/cupertino.dart';
import 'package:write_app/models/models.dart';

class DocumentController extends ChangeNotifier {
  List<Document> _list = [];

  List _searchList = [];

  Document? _updateDocument;

  List<Document> get allDocuments => _list;

  //getters

  int get documentCount => _list.length;

  Document? get updateDocument => _updateDocument;

  //  set documents

  void writeDocument(String? write) {
    final document = Document(document: write);
    _list.add(document);
    notifyListeners();
  }

  void deleteDocument(Document document) {
    _list.remove(document);
    notifyListeners();
  }

  void setToUpdateDocument(int index, String document) {
    _list[index].document = document;
    notifyListeners();
  }

  void searchDocument(String query) {
    if (query.isNotEmpty) {
      List<Document> searching =
          _list.where((docu) => docu.document == query).toList();
      _searchList.add(searching);
    }
    notifyListeners();
  }
}
