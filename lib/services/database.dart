import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  final CollectionReference<Map<String, dynamic>> customer =
      FirebaseFirestore.instance.collection('users');

  Future updateUserData({String? name, String? mail, String? pic}) async {
    await customer.doc(uid).set({
      'name': name,
      'mail': mail,
      'profile_pic': pic,
    });
  }
}
