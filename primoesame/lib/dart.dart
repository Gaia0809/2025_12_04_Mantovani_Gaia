class Exercise {
  Exercise({
    required this.name,
    required this.score,
    required this.submittedAt,
  });

  String name;
  int score;
  bool submittedAt;
}

// 1 aggiungi un getter isPassed che determina se il punteggio è sufficiente (i.e. maggiore o uguale a 60)
bool isPassed(Exercise exercise) {
  return exercise.score >= 60;
}
// 2 scrivi una funzione passedOnly che accetta una lista di esercizi e restituisce una nuova lista di esercizi con le sole sufficienze
List<Exercise> passedOnly(List<Exercise> exercises) {
  List<Exercise> result = [];
  for (Exercise exercise in exercises) {
    if (isPassed(exercise)) {
      result.add(exercise);
    }
  }
  return result;
}

// 3 scrivi una funzione averageScore che accetta una lista di esercizi e ne calcola il punteggio medio
double averageScore(List<Exercise> exercises) {
  if (exercises.isEmpty) {
    return 0.0;
  }
  int totalScore = 0;
  for (Exercise exercise in exercises) {
    totalScore = totalScore + exercise.score;
  }
  return totalScore / exercises.length;
}

// 4 scrivi una funzione bestStudent che accetta una lista di esercizi e restituisce il nome dello studente con il punteggio più alto
String? bestStudent(List<Exercise> exercises) {
  if (exercises.isEmpty) {
    return null;
  }
  Exercise best = exercises[0];
  for (int i = 1; i < exercises.length; i++) {
    if (exercises[i].score > best.score) {
      best = exercises[i];
    }
  }
  return best.name;
}