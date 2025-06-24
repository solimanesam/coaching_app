String? validateEmpty(String? value) {
  if (value == null || value.isEmpty) {
    return "This Field is required!";
  }

  return null;
}
