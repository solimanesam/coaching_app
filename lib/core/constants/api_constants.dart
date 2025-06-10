class ApiConstants {
  static const String baseUrl = 'https://localhost:7249/api/';
  static const String authBaseUrl = '${baseUrl}Auth/';
  static const String forgetPasswordUrl = '${authBaseUrl}ForgotPassword';
  static const String signUpUrl = '${authBaseUrl}Register';
  static const String logInUrl = '${authBaseUrl}token';
}
