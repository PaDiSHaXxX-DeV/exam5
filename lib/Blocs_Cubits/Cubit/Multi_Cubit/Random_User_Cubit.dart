import 'package:exam5/Blocs_Cubits/Cubit/Multi_Cubit/Random_User_State.dart';
import 'package:exam5/Data/Models/my_response.dart';
import 'package:exam5/Data/Repos/Random_User_Repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MultiRandomUserCubit extends Cubit<MultiRandomUserState>{
  MultiRandomUserCubit({required this.randomUserRepository}):super(InitialState()){
    _fetchAllData();
  }

  final RandomUserRepo randomUserRepository;

  _fetchAllData() async{
    emit(LoadInProgress());
    MyResponse myResponse = await randomUserRepository.fetchAllData();
    if(myResponse.error.isEmpty){
      emit(LoadInSuccess(randomUserModel: myResponse.data));
    }else{
      emit(LoadInFailure(error: myResponse.error));
    }
  }
}