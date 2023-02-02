import 'package:exam5/Blocs_Cubits/Cubit/Get_Notification_Cubit/Get_Notification_State.dart';
import 'package:exam5/Blocs_Cubits/Notification_Bloc/Notification_Event.dart';
import 'package:exam5/Blocs_Cubits/Notification_Bloc/Notification_State.dart';
import 'package:exam5/Data/Repos/Notification_Repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationBloc extends Bloc<NotificationEvent,NotificationStates>{
  NotificationBloc({required this.notificationRepository}):super(InitialNotificationStates()){
    on<AddNotification>(addNotification);
  }

  final NotificationRepo notificationRepository;

  addNotification(AddNotification event, Emitter<NotificationStates> emit){
    emit(LoadingNotificationProgress());
    notificationRepository.addNotification(notificationModel: event.notificationModel);
  }

}