/// models/user_model.dart

class UserModel {
  final String uid;
  final String name;
  final int coins; // total coins (accumulated)
  final int points; // new field for points
  final Map<String, int> quizScores; // key: quizId, value: score

  UserModel({
    required this.uid,
    required this.name,
    this.coins = 0,
    this.points = 0, // initialize points
    Map<String, int>? quizScores,
  }) : quizScores = quizScores ?? {};

  /// Converts UserModel → Firestore data
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'coins': coins,
      'points': points, // save points
      'quizScores': quizScores,
    };
  }

  /// Converts Firestore data → UserModel
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      coins: map['coins'] ?? 0,
      points: map['points'] ?? 0, // read points
      quizScores: Map<String, int>.from(map['quizScores'] ?? {}),
    );
  }

  /// Creates a modified version (useful for updating values)
  UserModel copyWith({
    String? uid,
    String? name,
    int? coins,
    int? points, // allow updating points
    Map<String, int>? quizScores,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      coins: coins ?? this.coins,
      points: points ?? this.points,
      quizScores: quizScores ?? this.quizScores,
    );
  }
}
