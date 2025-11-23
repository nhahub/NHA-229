import 'package:cloud_firestore/cloud_firestore.dart';

class QuizService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Records a quiz attempt, accumulates coins, keeps a history, and updates points
  Future<void> finishQuiz({
    required String uid,
    required String quizId,
    required String userName,
    required int score,
  }) async {
    if (uid.isEmpty || quizId.isEmpty) throw Exception('Invalid uid or quizId');

    final userDoc = _firestore.collection('users').doc(uid);
    final quizAttemptsCollection = userDoc.collection('quizAttempts');

    // Calculate points based on score
    int pointsChange = 0;
    if (score >= 8) {
      pointsChange = 50;
    } else if (score < 2) {
      pointsChange = -50;
    }

    try {
      // Ensure user document exists with name
      await userDoc.set({
        'name': userName,
      }, SetOptions(merge: true));

      // Increment coins by score
      await userDoc.update({
        'coins': FieldValue.increment(score),
        'points': FieldValue.increment(pointsChange), // Update points
      }).catchError((_) async {
        // If user document is new, initialize coins and points
        await userDoc.set({
          'coins': score,
          'points': pointsChange,
        }, SetOptions(merge: true));
      });

      // Create a new attempt document for this quiz attempt
      await quizAttemptsCollection.add({
        'quizId': quizId,
        'score': score,
        'points': pointsChange,
        'timestamp': FieldValue.serverTimestamp(),
      });

    } catch (e) {
      throw Exception('Error finishing quiz: $e');
    }
  }
}