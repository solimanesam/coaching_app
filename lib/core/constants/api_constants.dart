class ApiConstants {
  static const String baseUrl = 'https://coachingfit.somee.com/api/';
  static const String authBaseUrl = '${baseUrl}Auth/';
  static const String forgetPasswordUrl = '${authBaseUrl}ForgotPassword';
  static const String signUpUrl = '${authBaseUrl}Register';
  static const String logInUrl = '${authBaseUrl}token';
  static const String coachesUrl = '${authBaseUrl}Coaches';
  static const String editImageUrl = '${authBaseUrl}EditImage';
  static const String editProfilrUrl = '${authBaseUrl}EditProfile';
  static const String getProfileUrl = '${authBaseUrl}GetProfile';
  static const String paymentIntentEndPoint =
      'https://api.stripe.com/v1/payment_intents';
}
