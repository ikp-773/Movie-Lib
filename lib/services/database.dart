import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_app/models/user.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  final CollectionReference<Map<String, dynamic>> user =
      FirebaseFirestore.instance.collection('users');

  Future updateUserData({String? name, String? mail, String? pic}) async {
    await user.doc(uid).set({
      'name': name,
      'mail': mail,
      'profile_pic': pic,
    });
  }

  List<UserDataModel> _userListFromSnapshot(
      QuerySnapshot<Map<String, dynamic>> snapshot) {
    return snapshot.docs.map((DocumentSnapshot<Map<String, dynamic>> doc) {
      return UserDataModel(
        name: doc.data()!['name'] ?? '',
        email: doc.data()!['mail'] ?? '',
        pic: doc.data()!['pic'] ?? '',
      );
    }).toList();
  }

  UserData _userDataFromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return UserData(
      uid: uid!,
      name: snapshot.data()!['name'],
      email: snapshot.data()!['address'],
      pic: snapshot.data()!['pic'],
    );
  }

  Stream<List<UserDataModel>> get userDetails {
    return user.snapshots().map(_userListFromSnapshot);
  }

  Stream<UserData> get userData {
    return user.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}
