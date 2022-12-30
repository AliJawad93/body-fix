import 'dart:math';

import 'package:body_fix2/body%20fix/models/food_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseFood {
  static final _food = FirebaseFirestore.instance.collection('food');

  static Future<void> sendDataFood(FoodModel foodModel) async {
    _food.add(foodModel.toMap());
  }

  static Stream<List<FoodModel>> getDataFood() {
    var snapShot = _food.snapshots();
    var foodModel = snapShot.map((element) {
      return element.docs.map((e) {
        return FoodModel.fromMap(e.data());
      }).toList();
    });
    return foodModel;
  }

  static Future<List<FoodModel>> searchDataFood(String title) async {
    var snapShot = await _food.get();
    var foodModel = snapShot.docs
        .where((element) => element["title"].toString().contains(title))
        .map((element) {
      return FoodModel.fromMap(element.data());
    }).toList();
    return foodModel;
  }

  static Future<void> deleteDataFood(String title) async {
    var snapShot = await _food.get();
    String id = snapShot.docs
        .where((element) => element["title"].toString().contains(title))
        .map((element) {
      return element.id;
    }).first;

    await _food.doc(id).delete();
  }
}
