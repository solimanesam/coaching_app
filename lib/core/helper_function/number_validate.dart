String? validateNumber(String? value, {String fieldName = "This field"}) {
  if (value == null || value.trim().isEmpty) {
    return "$fieldName is required!";
  }

  // تأكد أن القيمة رقم صحيح أو عشري
  if (!RegExp(r'^\d+(\.\d+)?$').hasMatch(value)) {
    return "$fieldName must be a valid number!";
  }

  double number = double.tryParse(value) ?? 0;

  // تحقق من الحد الأدنى
  if (number <= 0) {
    return "$fieldName must be greater than 0!";
  }

  // تحقق من الحد الأقصى (اختياري - مثلًا 300 للوزن أو الطول)
  if (number > 300) {
    return "$fieldName must not exceed 300!";
  }

  return null;
}
