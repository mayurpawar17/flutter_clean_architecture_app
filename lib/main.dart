import 'package:clean_architecture_app/features/product/presentation/pages/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di/di.dart' as di;
import 'features/product/presentation/bloc/product_bloc.dart';

void main() {
  di.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => di.sl<ProductBloc>())],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const ProductScreen(),
      ),
    );
  }
}
