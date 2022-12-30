class ExercisesModel {
  String title;
  String type;
  String urlImage;
  double calories;
  String time;
  ExercisesModel({
    required this.title,
    required this.type,
    required this.urlImage,
    required this.calories,
    required this.time,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'type': type,
      'urlImage': urlImage,
      'calories': calories,
      'time': time,
    };
  }

  factory ExercisesModel.fromMap(Map<String, dynamic> map) {
    return ExercisesModel(
      title: map['title'] ?? '',
      type: map['type'] ?? '',
      urlImage: map['urlImage'] ?? '',
      calories: map['calories'] ?? "",
      time: map['time'] ?? "",
    );
  }
}
