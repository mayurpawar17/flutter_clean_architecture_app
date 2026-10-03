import 'package:clean_architecture_app/core/network/api_client.dart';
import 'package:clean_architecture_app/core/utils/app_observer.dart';
import 'package:clean_architecture_app/core/utils/app_router.dart';
import 'package:clean_architecture_app/features/post/data/remoteDataSource/post_remote_data_source.dart';
import 'package:clean_architecture_app/features/post/data/repositories/post_repository_impl.dart';
import 'package:clean_architecture_app/features/post/domain/usecase/create_post_usecase.dart';
import 'package:clean_architecture_app/features/post/domain/usecase/get_posts_usecase.dart';
import 'package:clean_architecture_app/features/post/presentation/bloc/post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = AppObserver();

  runApp(
    MultiRepositoryProvider(
      providers: [
        //api client
        RepositoryProvider(create: (context) => ApiClient()),

        //data sources
        RepositoryProvider(
          create: (context) =>
              PostRemoteDataSourceImpl(context.read<ApiClient>()),
        ),

        //repositories
        RepositoryProvider(
          create: (context) =>
              PostRepositoryImpl(context.read<PostRemoteDataSourceImpl>()),
        ),

        //usecaes
        RepositoryProvider(
          create: (context) =>
              GetPostsUseCase(context.read<PostRepositoryImpl>()),
        ),
        RepositoryProvider(
          create: (context) =>
              CreatePostUseCase(context.read<PostRepositoryImpl>()),
        ),
      ],

      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => PostBloc(
              getPostsUseCase: context.read<GetPostsUseCase>(),
              createPostUseCase: context.read<CreatePostUseCase>(),
            ),
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      routerConfig: AppRouter.router,
    );
  }
}
