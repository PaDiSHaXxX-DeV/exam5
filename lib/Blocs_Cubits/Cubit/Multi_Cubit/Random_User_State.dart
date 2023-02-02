import 'package:exam5/Data/Models/User_Rndom_Model.dart';

abstract class MultiRandomUserState {}

class InitialState extends MultiRandomUserState {}

class LoadInProgress extends MultiRandomUserState {}

class LoadInSuccess extends MultiRandomUserState {
  LoadInSuccess({required this.randomUserModel});
  final RandomUserModel randomUserModel;
}

class LoadInFailure extends MultiRandomUserState {
  LoadInFailure({required this.error});
  final String error;
}
