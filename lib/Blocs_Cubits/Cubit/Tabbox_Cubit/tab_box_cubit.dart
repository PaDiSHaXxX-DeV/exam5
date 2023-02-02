import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tab_box_state.dart';

class TabBoxCubit extends Cubit<TabBoxState> {
  TabBoxCubit() : super(TabBoxState(currentPage: 0));

  void changeTabState(int changedIndex) {
    emit(state.copyWith(currentPage: changedIndex));
  }
}
