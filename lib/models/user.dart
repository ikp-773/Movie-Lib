class UserModel {
  final String uid;
  UserModel({required this.uid});
}

class UserData {
  final String uid;
  final String name;
  final String email;
  final String pic;

  UserData({
    required this.uid,
    required this.name,
    required this.email,
    required this.pic,
  });
}

class UserDataModel {
  final String name;
  final String email;
  final String pic;

  UserDataModel({
    required this.name,
    required this.email,
    required this.pic,
  });
}
