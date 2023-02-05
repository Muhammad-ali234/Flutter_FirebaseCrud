import 'package:cloud_firestore/cloud_firestore.dart';

//instance of firebase
FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

class DataBaseServices {
  static Future<void> addData(String title, String detail) async {
    //calling collection and add data
    firebaseFirestore.collection("notes").add({
      "title": title,
      "detail": detail,
    });
  }

  //function to delete data in firebase
  static Future<void> delete(String id) async {
    await firebaseFirestore.collection('notes').doc(id).delete();
  }

  static Future<void> updateData(String id, String title, String detail) async {
    await firebaseFirestore
        .collection('notes')
        .doc(id)
        .update({'title': title, 'detail': detail});
  }
}
