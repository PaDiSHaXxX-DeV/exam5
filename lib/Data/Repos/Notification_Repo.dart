import 'package:exam5/Data/Local/LOCAL_DB.dart';
import 'package:exam5/Data/Models/Notification_Model.dart';

class NotificationRepo {
  Future<NotificationModel> addNotification(
      {required NotificationModel notificationModel}) =>
      LocalDatabase.addNotification(notificationModel);

  Future<List<NotificationModel>> getAllNotification() =>
      LocalDatabase.getAllNotifications();
}
