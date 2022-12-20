import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String? id;
  String catname;
  CategoryModel({required this.catname, this.id});

  Map<String, dynamic> toSnapshot() {
    return {"name": catname};
  }

  CategoryModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        catname = doc.data()!['catname'];

  String toJson() => json.encode(toSnapshot());
}
