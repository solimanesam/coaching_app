String? validateName(String? value) {
  if (value == null || value.isEmpty) {
    return "name is required!";
  }
  if (value.length < 3) {
    return "The name must be at least 3 characters long!";
  }
  if (value.length > 30) {
    return "The name must not exceed 30 characters!";
  }
  if (value.contains(' ')) {
    return "Spaces are not allowed in the name!";
  }
  if (!RegExp(r'^[a-zA-Z\u0621-\u064A]+$').hasMatch(value)) {
    return "The name should contain only letters!";
  }
  return null;
}
