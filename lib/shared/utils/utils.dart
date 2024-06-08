String pluralize(int number, String word) {
  if (number == 1) {
    return '$number $word';
  } else {
    return '$number ${word}s';
  }
}
