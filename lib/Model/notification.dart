/*
class NotificationModel {
  final String title;
  final String body;
  final String? imageUrl;

  NotificationModel({required this.title, required this.body, this.imageUrl});
}
*/
class NotificationModel {
  final String title;
  final String body;
  final String? imageUrl;
  final String type;
  final String timestamp;
  final String userEmail;
  final String userName;
  final String userAddress;

  NotificationModel({
  required this.title,
  required this.body,
  this.imageUrl,
  required this.type,
  required this.timestamp,
  required this.userEmail,
  required this.userName,
  required this.userAddress,
  });
}