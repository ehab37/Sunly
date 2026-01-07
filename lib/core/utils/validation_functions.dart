String? cityValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a city name';
  }

  if (value.length < 2) {
    return 'City name must be at least 2 characters';
  }

  // Regex to ensure only letters and spaces are used
  // This prevents inputs like "L0nd0n" or "!!!@#"
  final cityRegex = RegExp(r"^[a-zA-Z\s\u0080-\u024F]+$");
  if (!cityRegex.hasMatch(value)) {
    return 'Please enter a valid city name (letters only)';
  }

  return null;
}