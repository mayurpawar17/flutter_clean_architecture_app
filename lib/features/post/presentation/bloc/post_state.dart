import 'package:clean_architecture_app/features/post/domain/entity/post_entity.dart';

abstract class PostState {
  final List<PostEntity> posts;

  PostState({required this.posts});
}

class PostInitialState extends PostState {
  PostInitialState() : super(posts: []);
}

class PostLoadingState extends PostState {
  PostLoadingState({required super.posts});
}

class PostLoadedState extends PostState {
  PostLoadedState({required super.posts});
}

class PostFailureState extends PostState {
  final String message;
  PostFailureState({required super.posts, required this.message});
}
