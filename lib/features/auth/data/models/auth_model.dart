class AuthModel {
  AuthModel({required this.token, required this.role});
  final String token;
  final String role;

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        token: json['token'],
        role: json['roles'][0],
      );
}
