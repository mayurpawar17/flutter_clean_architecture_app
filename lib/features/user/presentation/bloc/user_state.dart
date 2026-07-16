
import 'package:clean_architecture_app/features/user/data/models/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable {}

final class UserInitial extends UserState {
  @override
  List<Object?> get props => throw UnimplementedError();
}
final class UserLoading extends UserState {
  @override
  List<Object?> get props => throw UnimplementedError();
}
final class UserSuccess extends UserState {
  final List<UserModel> userModel;

  UserSuccess(this.userModel);

  @override
  List<Object?> get props => [userModel];
}
final class UserFailure extends UserState {
  @override
  List<Object?> get props => throw UnimplementedError();
}
