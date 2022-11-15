import 'dart:convert';

class FoodModel {
  String title;
  String type;
  String urlImage;
  double calories;
  double fat;
  double carbs;
  double protein;
  FoodModel({
    required this.title,
    required this.type,
    required this.urlImage,
    required this.calories,
    required this.fat,
    required this.carbs,
    required this.protein,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'type': type,
      'urlImage': urlImage,
      'calories': calories,
      'fat': fat,
      'carbs': carbs,
      'protein': protein,
    };
  }

  factory FoodModel.fromMap(Map<String, dynamic> map) {
    return FoodModel(
      title: map['title'] ?? '',
      type: map['type'] ?? '',
      urlImage: map['urlImage'] ?? '',
      calories: map['calories']?.toDouble() ?? 0.0,
      fat: map['fat']?.toDouble() ?? 0.0,
      carbs: map['carbs']?.toDouble() ?? 0.0,
      protein: map['protein']?.toDouble() ?? 0.0,
    );
  }
}
