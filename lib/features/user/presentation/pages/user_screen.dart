import 'package:clean_architecture_app/features/user/presentation/bloc/user_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user_bloc.dart';
import '../bloc/user_state.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<UserBloc>().add(FetchUser());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is UserSuccess) {
              return ListView.builder(
                itemCount: state.userModel.length,
                itemBuilder: (context, index) {
                  final user = state.userModel[index];
                  return ListTile(
                    title: Text(user.name ?? ''),
                    subtitle: Text(user.email ?? ''),
                  );
                },
              );
            }

            return const Center(child: Text("Something went wrong"));
          },
        ),
      ),
    );
  }
}
