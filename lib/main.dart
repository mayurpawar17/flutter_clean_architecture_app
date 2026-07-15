import 'package:clean_architecture_app/repo/user_repository.dart';
import 'package:clean_architecture_app/repo/user_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'bloc/user_bloc.dart';
import 'bloc/user_event.dart';
import 'bloc/user_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        // 1. Provide the Repository
        RepositoryProvider<UserRepository>(
          create: (context) => UserRepositoryImpl(client: http.Client()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          // 2. Provide the Bloc and inject the Repository
          BlocProvider<UserBloc>(
            create: (context) => UserBloc(
           RepositoryProvider.of<UserRepository>(context),
            )..add(FetchUsersEvent()), // Automatically trigger fetch on startup
          ),
        ],
        child: const MaterialApp(
          home: UserScreen(),
        ),
      ),
    );
  }
}

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bloc + Equatable Example')),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is UserLoaded) {
            return ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (context, index) {
                final user = state.users[index];
                return ListTile(
                  title: Text(user.name),
                  subtitle: Text(user.email),
                );
              },
            );
          } else {
            return const Center(child: Text('Press fetch to load users'));
          }
        },
      ),
    );
  }
}