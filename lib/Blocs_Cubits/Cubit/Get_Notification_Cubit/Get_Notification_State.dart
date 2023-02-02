import 'package:exam5/Data/Models/Notification_Model.dart';

abstract class GetNotificationState {}

class InitialNotificationState extends GetNotificationState {}

class LoadNotificationProgress extends GetNotificationState {}

class LoadNotificationSuccess extends GetNotificationState {
  LoadNotificationSuccess({required this.notifications});

  final List<NotificationModel> notifications;
}

class LoadNotificationFailure extends GetNotificationState {}
