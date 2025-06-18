class ApiConstants {
  static const String baseUrl = 'http://10.0.2.2:7249/api/';
  static const String authBaseUrl = '${baseUrl}Auth/';
  static const String forgetPasswordUrl = '${authBaseUrl}ForgotPassword';
  static const String signUpUrl = '${authBaseUrl}Register';
  static const String logInUrl = '${authBaseUrl}token';
  static const String coachesUrl = '${authBaseUrl}Coashes';
  static const String editImageUrl = '${authBaseUrl}EditImage';
  static const String paymentIntentEndPoint =
      'https://api.stripe.com/v1/payment_intents';
}
