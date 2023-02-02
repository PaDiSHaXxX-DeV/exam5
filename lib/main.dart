import 'package:exam5/App/App.dart';
import 'package:exam5/App/Bloc_Observer.dart';
import 'package:exam5/Data/Local/LOCAL_DB.dart';
import 'package:exam5/Data/Models/Notification_Model.dart';
import 'package:exam5/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  var notif = message.data.values.map((e) => e);
  await LocalDatabase.addNotification(NotificationModel(
      title: message.notification!.title.toString(),
      date: DateTime.now().toString(),
      body: notif.first,
      image: notif.first));
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await FirebaseMessaging.instance.subscribeToTopic("news");
  Bloc.observer = AppBlocObserver();
  setup();
  runApp(const App());
}
