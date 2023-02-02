

abstract class NotificationStates {}

class InitialNotificationStates extends NotificationStates {}

class LoadingNotificationProgress extends NotificationStates {}

class LoadingNotificationSuccess extends NotificationStates {
}

class LoadNotificationFailure extends NotificationStates {}
