import 'package:exam5/Blocs_Cubits/Cubit/Multi_Cubit/Random_User_Cubit.dart';
import 'package:exam5/Blocs_Cubits/Cubit/Multi_Cubit/Random_User_State.dart';
import 'package:exam5/Data/Repos/Random_User_Repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageB extends StatelessWidget {
  const PageB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PageB"),
      ),
      body: BlocProvider(
          create: (context) =>  MultiRandomUserCubit(randomUserRepository: context.read<RandomUserRepo>()),
        child: BlocBuilder<MultiRandomUserCubit,MultiRandomUserState>(builder: (context,state){
          if(state is LoadInProgress){
            return const Center(child: CircularProgressIndicator(),);
          }else if(state is LoadInFailure){
            return Center(child: Text(state.error));
          }else if(state is LoadInSuccess){
            return Column(
              children: [
                ...List.generate(state.randomUserModel.results.length, (index) {
                  var item = state.randomUserModel!.results[index];
                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(item.login.username.toString()),
                        subtitle: Text(item.email.toString()),
                        trailing: Image.network(item.picture.medium.toString()),
                      )
                  );
                }),
              ],
            );
          }
          return const SizedBox();
        }
        ),
      ),

    );
  }
}
