
import 'package:equatable/equatable.dart';
import 'package:exam5/Data/Models/User_Rndom_Model.dart';

class SingleRandomUserState extends Equatable {
  final ContactStatus status;
  final String errorText;
  final RandomUserModel? randomUsers;

  const SingleRandomUserState(
      {required this.status, required this.errorText, required this.randomUsers});

  SingleRandomUserState copyWith(
      {ContactStatus? status,
        RandomUserModel? randomUsers,
        String? errorText}) =>
      SingleRandomUserState(
          status: status ?? this.status,
          errorText: errorText ?? this.errorText,
          randomUsers: randomUsers ?? this.randomUsers);

  @override
  List<Object?> get props => [
    status,
    errorText,
    randomUsers
  ];
}

enum ContactStatus {loading, pure, failure ,success}
