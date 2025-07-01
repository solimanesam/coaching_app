class AuthModel {
  AuthModel({required this.userName, required this.token, required this.role});
  final String token;
  final String role;
  final String userName;

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        token: json['token'],
        role: json['roles'][0],
        userName: json['userName'],
      );
}
