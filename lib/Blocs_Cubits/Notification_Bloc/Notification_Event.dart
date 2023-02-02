import 'package:exam5/Data/Models/Notification_Model.dart';

abstract class NotificationEvent{}


class AddNotification extends NotificationEvent{
  AddNotification({required this.notificationModel});
  final NotificationModel notificationModel;
}