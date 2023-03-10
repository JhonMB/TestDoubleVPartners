part of 'home_cubit.dart';

class HomeState {
  final List<UserModel> listUser;

  HomeState({required this.listUser});

  factory HomeState.initial() => HomeState(
        listUser: [],
      );

  HomeState copyWith({
    List<UserModel>? listUser,
  }) {
    return HomeState(
      listUser: listUser ?? this.listUser,
    );
  }
}
