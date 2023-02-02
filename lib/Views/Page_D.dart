

import 'package:exam5/Blocs_Cubits/Cubit/Get_Notification_Cubit/Get_Notification_Cubit.dart';
import 'package:exam5/Blocs_Cubits/Cubit/Get_Notification_Cubit/Get_Notification_State.dart';
import 'package:exam5/Views/widgets/Notification_Widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class PageD extends StatelessWidget {
  const PageD({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => GetNotificationCubit(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          actions: [
            // IconButton(
            //   color: Colors.red,
            //   onPressed: () {
            //     LocalDatabase.deleteAllNotification();
            //   },
            //   icon: const Icon(Icons.delete),
            // ),

          ],
          iconTheme: const IconThemeData(color: Colors.blue),
          title:const Text(
            "PageD",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          physics:const BouncingScrollPhysics(),
          child: BlocConsumer<GetNotificationCubit, GetNotificationState>(
            listener: (context,state){
              if(state is LoadNotificationProgress){
                BlocProvider.of<GetNotificationCubit>(context).getAllNotifications();

              }
            },
            builder: (context, state) {
              if (state is LoadNotificationProgress) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is LoadNotificationSuccess) {
                return Column(

                  children: [
                    Text(state.notifications.length.toString()),
                    ...List.generate(state.notifications.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: notifications(
                            imgPath: state.notifications[index].image,
                            title: state.notifications[index].title,
                            desc: state.notifications[index].body),
                      );
                    }),
                  ],
                );
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                  ),
                const  SizedBox(
                    height: 10,
                  ),
                 const Text(
                    'You don`t have an notification',
                    style: TextStyle(),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}