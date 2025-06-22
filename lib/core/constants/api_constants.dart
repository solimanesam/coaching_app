class ApiConstants {
  static const String baseUrl = 'https://coachingfit.somee.com/api/';
  static const String authBaseUrl = '${baseUrl}Auth/';
  static const String cvBaseUrl = '${baseUrl}CV/';

  static const String forgetPasswordUrl = '${authBaseUrl}ForgotPassword';
  static const String signUpUrl = '${authBaseUrl}Register';
  static const String logInUrl = '${authBaseUrl}token';
  static const String coachesUrl = '${authBaseUrl}Coaches';
  static const String editImageUrl = '${authBaseUrl}EditImage';
  static const String createPlanUrl = '${baseUrl}Subscription/CreatePlan';
  static const String subscribeUrl = '${authBaseUrl}Subscription/Subscribe';
  static const String getSubscriptionPlansUrl =
      '${authBaseUrl}Subscription/SubscriptionPlans';
  static const String getSubscriptionPlanByCoachUrl =
      '${authBaseUrl}Subscription/SubscriptionPlanByCoach';
  static const String getSubscribersUrl = '${baseUrl}Subscription/Subscribers';
  static const String getSubscriberFilesUrl =
      '${authBaseUrl}PersonalizedPlan/GetSubscriberFiles';
  static const String uploadPersonalizedPlanUrl =
      '${authBaseUrl}PersonalizedPlan/Upload';
  static const String sendPrombtUrl = '${authBaseUrl}';
  static const String paymentIntentEndPoint =
      'https://api.stripe.com/v1/payment_intents';
  static const String editProfilrUrl = '${authBaseUrl}EditProfile';
  static const String getProfileUrl = '${authBaseUrl}GetProfile';
  static const String uploadCvUrl = '${cvBaseUrl}upload';
  static const String getCvUrl = '${cvBaseUrl}my-cv';
  static const String deleteCvUrl = '${cvBaseUrl}delete';
}
