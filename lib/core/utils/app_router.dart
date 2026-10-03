import 'package:clean_architecture_app/features/post/presentation/pages/create_post_screen.dart';
import 'package:clean_architecture_app/features/post/presentation/pages/post_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter router = GoRouter(routes: [
    GoRoute(path: '/', builder: (context, state) => const PostScreen()),
    GoRoute(path: '/createPost', builder: (context, state) => const CreatePostScreen()),

  ]);
}
