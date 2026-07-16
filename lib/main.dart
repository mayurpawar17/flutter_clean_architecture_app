import 'package:clean_architecture_app/features/user/presentation/bloc/user_bloc.dart';
import 'package:clean_architecture_app/features/user/presentation/pages/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/network/api_client.dart';
import 'features/user/data/repo/user_repository.dart';

void main() {

  final apiClient = ApiClient();
  final UserRepository userRepository = UserRepository(apiClient);
  runApp(MyApp(userRepository: userRepository,));
}

class MyApp extends StatelessWidget {
  final UserRepository userRepository;
  const MyApp({super.key, required this.userRepository});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(create: (context) => UserBloc(userRepository: userRepository))
      ],
      child: MaterialApp(
        home: const UserScreen(),
      ),
    );
  }
}

