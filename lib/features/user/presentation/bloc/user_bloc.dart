import 'package:bloc/bloc.dart';
import 'package:clean_architecture_app/features/user/presentation/bloc/user_event.dart';
import 'package:clean_architecture_app/features/user/presentation/bloc/user_state.dart';

import '../../data/repo/user_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({required this.userRepository}) : super(UserInitial()) {
    on<FetchUser>((event, emit) async {
      emit(UserLoading());
      try {
        final users = await userRepository.fetchUsers();
        emit(UserSuccess(users));
      } catch (e) {
        emit(UserFailure());
      }
    });
  }
}
