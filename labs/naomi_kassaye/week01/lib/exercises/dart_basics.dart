// Week 1 Dart exercises — variables, operators, control flow, functions,
// collections. Replace each `throw UnimplementedError()` with a working
// implementation. Run the tests with:
//
//   flutter test test/exercises
//
// The worked examples from the lecture are in lecture_examples.dart. Each
// exercise below is similar to one of them, but not the same: read the
// example, close the file, then write the exercise yourself.
//
// You can also paste a function into https://dartpad.dev to experiment.

/// Returns 'Fizz' if [n] is divisible by 3, 'Buzz' if divisible by 5,
/// 'FizzBuzz' if divisible by both, otherwise [n] as a string.
String fizzBuzz(int n) {
  if (n % 15 == 0) {
    return 'FizzBuzz';
  }
  if (n % 3 == 0) {
    return 'Fizz';
  }
  if (n % 5 == 0) {
    return 'Buzz';
  } else {
    return '$n';
  }
}

/// Returns the average of the numbers in [numbers] that are greater than
/// zero. If there are none, returns 0.
/// [1.0, -2.0, 3.0] → 2.0
double averageOfPositives(List<double> numbers) {
  final positives = numbers.where((n) => n > 0);
  if (positives.isEmpty) {
    return 0;
  }
  final total = positives.fold(0.0, (sum, n) => sum + n);
  return total / positives.length;
}

/// Returns the body-mass-index category: below 18.5 'Underweight',
/// below 25 'Normal', below 30 'Overweight', otherwise 'Obese'.
/// Throws [ArgumentError] if [bmi] is zero or negative.
String bmiCategory(double bmi) {
  if (bmi <= 0) {
    throw ArgumentError('BMI must be positive');
  }
  return switch (bmi) {
    < 18.5 => 'Underweight',
    < 25.0 => 'Normal',
    < 30.0 => 'Overweight',
    _ => 'Obese',
  };
}

/// Returns true when [text] reads the same forwards and backwards,
/// ignoring case and any character that is not a letter or digit.
/// 'A man, a plan, a canal: Panama' → true.
bool isPalindrome(String text) {
  final clean = text.toLowerCase().replaceAll(RegExp('[^a-z0-9]'), '');
  final reversed = clean.split('').reversed.join();
  return clean == reversed;
}

/// Counts how many times each letter a–z occurs in [text], ignoring case.
/// Spaces, digits and punctuation are not counted.
/// 'Hello, World!' → {'h': 1, 'e': 1, 'l': 3, 'o': 2, 'w': 1, 'r': 1, 'd': 1}
Map<String, int> letterCount(String text) {
  final counts = <String, int>{};
  final cleaned = text.toLowerCase().replaceAll(RegExp(r'[^a-z]'), '');
  for (final char in cleaned.split('')) {
    counts[char] = (counts[char] ?? 0) + 1;
  }
  return counts;
}

/// Converts a distance. [value] is in kilometres by default and the result
/// is in miles; pass `toKilometres: true` to convert miles to kilometres
/// instead. 1 km = 0.621371 miles. Round the result to one decimal place.
double convertDistance(double value, {bool toKilometres = false}) {
  const factor = 0.621371;
  final converted = toKilometres ? value / factor : value * factor;
  return double.parse(converted.toStringAsFixed(1));
}

/// Returns the first [count] Fibonacci numbers starting 0, 1, 1, 2, ...
/// count ≤ 0 → empty list.
List<int> fibonacci(int count) {
  if (count <= 0) return [];
  if (count == 1) return [0];
  final list = <int>[0, 1];
  while (list.length < count) {
    list.add(list[list.length - 1] + list[list.length - 2]);
  }
  return list;
}

/// Summarises a value that may be null or of any type:
/// null → 'no value', true → 'yes', false → 'no',
/// a double → 'a decimal number', a String → '"hi" has 2 characters',
/// a Map → 'a map with 3 entries', anything else → 'unknown'.
String summarise(Object? value) {
  return switch (value) {
    null => 'no value',
    true => 'yes',
    false => 'no',
    double _ => 'a decimal number',
    final String s => '"$s" has ${s.length} characters',
    final Map<Object?, Object?> m => 'a map with ${m.length} entries',
    _ => 'unknown',
  };
}
