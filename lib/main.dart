import 'package:clean_architecture_app/features/product/presentation/pages/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di/di.dart' as di;
import 'core/di/injection_container.dart';
import 'features/product/presentation/bloc/product_bloc.dart';

void main() {
  // 1. MUST be called first to ensure Flutter engine services are ready.
  // This is mandatory because SharedPreferences/SQLite initialization talks to native host code.
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => sl<ProductBloc>())],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const ProductScreen(),
      ),
    );
  }
}
