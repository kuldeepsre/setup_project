
class DashboardModel {
  final bool ok;
  final dynamic response;

  final String message;

  DashboardModel({
    required this.ok,
    required this.response,

    this.message = '',
  });
}