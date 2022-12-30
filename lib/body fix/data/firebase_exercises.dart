import 'package:body_fix2/body%20fix/models/exercises_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseExercises {
  static final _exercises = FirebaseFirestore.instance.collection('exercises');

  static Future<void> sendDataExercises(ExercisesModel exercisesModel) async {
    _exercises.add(exercisesModel.toMap());
  }

  static Stream<List<ExercisesModel>> getDataExercises() {
    var snapShot = _exercises.snapshots();
    var exercisesModel = snapShot.map((element) {
      return element.docs.map((e) {
        return ExercisesModel.fromMap(e.data());
      }).toList();
    });
    return exercisesModel;
  }

  static Future<List<ExercisesModel>> searchDataExercises(String title) async {
    var snapShot = await _exercises.get();
    var exercisesModel = snapShot.docs
        .where((element) => element["title"].toString().contains(title))
        .map((element) {
      return ExercisesModel.fromMap(element.data());
    }).toList();
    return exercisesModel;
  }

  static Future<void> deleteDataExercises(String title) async {
    var snapShot = await _exercises.get();
    String id = snapShot.docs
        .where((element) => element["title"].toString().contains(title))
        .map((element) {
      return element.id;
    }).first;
    await _exercises.doc(id).delete();
  }
}
