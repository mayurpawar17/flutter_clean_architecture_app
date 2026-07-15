
//implementation without equatable

// abstract class UserEvent {}
// class FetchUsersEvent extends UserEvent {}


import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  @override
  List<Object?> get props => [];
}
class FetchUsersEvent extends UserEvent {}

