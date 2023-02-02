import 'package:exam5/Blocs_Cubits/Cubit/Get_Notification_Cubit/Get_Notification_State.dart';
import 'package:exam5/Data/Local/LOCAL_DB.dart';
import 'package:exam5/Data/Models/Notification_Model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetNotificationCubit extends Cubit<GetNotificationState> {
  GetNotificationCubit() : super(InitialNotificationState()) {
    getAllNotifications();
  }

  getAllNotifications() {
    emit(LoadNotificationProgress());
    LocalDatabase.getAllNotifications()
        .asStream()
        .listen((List<NotificationModel> notifications) {
      emit(LoadNotificationSuccess(notifications: notifications));
    });
  }
}
