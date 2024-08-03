class LoginModel {
  final String accessToken;
  final String id;
  final String username;
  final String message;
  final int statusCode;
  final bool success;

  LoginModel({
    required this.accessToken,
    required this.id,
    required this.username,
    required this.message,
    required this.statusCode,
    required this.success,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      accessToken: json['data']['access_token'],
      id: json['data']['id'],
      username: json['data']['username'],
      message: json['message'],
      statusCode: json['status_code'],
      success: json['success'],
    );
  }

  @override
  String toString() {
    return 'LoginModel(accessToken: $accessToken, id: $id, username: $username, message: $message, statusCode: $statusCode, success: $success)';
  }
}
