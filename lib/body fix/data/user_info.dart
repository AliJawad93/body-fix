import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_model.dart';

class FirebaseUserInfo {
  static final _users = FirebaseFirestore.instance.collection('user');

  static Future<void> sendDataUser(UserModel userModel) async {
    _users.doc(userModel.id).set(userModel.toMap());
  }

  static Future<UserModel> getDataUser(String id) async {
    var snapShot = await _users.doc(id).get();
    Map<String, dynamic> data = snapShot.data() as Map<String, dynamic>;
    return UserModel.fromMap(data);
  }

  static Future<void> updateVarable(
      {required String id, required String key, required String value}) async {
    var snapShot = await _users.doc(id).update({key: value});
  }
}
