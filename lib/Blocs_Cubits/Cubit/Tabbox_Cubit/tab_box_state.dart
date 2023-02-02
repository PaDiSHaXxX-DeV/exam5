part of 'tab_box_cubit.dart';

class TabBoxState extends Equatable {
  late final int currentPage;

  TabBoxState({
    required this.currentPage,
  });

  TabBoxState copyWith({
    int? currentPage,
  }) =>
      TabBoxState(
        currentPage: currentPage ?? this.currentPage,
      );

  @override
  List<Object?> get props => [
        currentPage,
      ];
}
