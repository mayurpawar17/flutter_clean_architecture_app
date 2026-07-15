import 'package:bloc/bloc.dart';
import 'package:clean_architecture_app/bloc/user_event.dart';
import 'package:clean_architecture_app/bloc/user_state.dart';
import 'package:meta/meta.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../repo/user_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository repository;

  UserBloc(this.repository) : super(UserInitial()) {
    on<FetchUsersEvent>((event, emit) async {
      emit(UserLoading());
      try {
        final users = await repository.fetchUsers();

        //implementation without equatable

        // // Emitting the exact same state setup twice on purpose to demonstrate
        // print("--- WITHOUT EQUATABLE ---");
        //
        // var state1 = UserLoaded(users);
        // var state2 = UserLoaded(users);
        //
        // print("Are states identical in value? Yes (same user list)");
        // print("Does state1 == state2? ${state1 == state2}"); // Will log: false
        //
        // emit(state1); // Triggers Rebuild 1
        // emit(state2); // Triggers Rebuild 2 (Even though data is identical!)




        //implementation with equatable
        print("--- WITH EQUATABLE ---");

        var state1 = UserLoaded(users);
        var state2 = UserLoaded(users);

        print("Are states identical in value? Yes (same user list)");
        print("Does state1 == state2? ${state1 == state2}"); // Will log: true

        emit(state1); // Triggers Rebuild 1
        emit(state2); // Ignored by Bloc! (No redundant UI rebuild)

      } catch (_) {}
    });
  }
}
