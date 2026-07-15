//implementation without equatable

// import '../models/user_model.dart';
//
// abstract class UserState {}
// class UserInitial extends UserState {}
// class UserLoading extends UserState {}
//
// class UserLoaded extends UserState {
//   final List<UserModel> users;
//   UserLoaded(this.users);
// }


import 'package:equatable/equatable.dart';

import '../models/user_model.dart';

abstract class UserState extends Equatable {
  @override
  List<Object?> get props => [];
}
class UserInitial extends UserState {}
class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final List<UserModel> users;

  UserLoaded(this.users);

  @override
  // Equatable uses this list to evaluate if two instances are identical
  List<Object?> get props => [users];
}