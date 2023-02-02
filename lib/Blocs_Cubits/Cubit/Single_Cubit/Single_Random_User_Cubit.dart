import 'package:exam5/Blocs_Cubits/Cubit/Single_Cubit/Single_random_User_State.dart';
import 'package:exam5/Data/Models/my_response.dart';
import 'package:exam5/Data/Repos/Random_User_Repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleRandomUserCubit extends Cubit<SingleRandomUserState> {
  SingleRandomUserCubit({required this.randomUserRepository})
      : super(const SingleRandomUserState(
      status: ContactStatus.pure, errorText: "", randomUsers: null)) {
    _fetchAllData();
  }

  final RandomUserRepo randomUserRepository;

  _fetchAllData() async {
    emit(state.copyWith(status: ContactStatus.loading));
    MyResponse myResponse = await randomUserRepository.fetchAllData();
    if (myResponse.error.isEmpty) {
      emit(state.copyWith(status: ContactStatus.success));
      emit(state.copyWith(randomUsers: myResponse.data));
    } else {
      emit(state.copyWith(status: ContactStatus.failure));
      emit(state.copyWith(errorText: myResponse.error));
    }
  }
}
