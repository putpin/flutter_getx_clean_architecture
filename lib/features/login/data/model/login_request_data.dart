class LoginRequestData {
  final String username;
  final String password;

  const LoginRequestData({
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'Username': username,
      'Password': password,
    };
  }
}
