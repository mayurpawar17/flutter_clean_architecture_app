import 'package:clean_architecture_app/core/usecase/usecase.dart';
import 'package:clean_architecture_app/features/post/domain/usecase/create_post_usecase.dart';
import 'package:clean_architecture_app/features/post/domain/usecase/get_posts_usecase.dart';
import 'package:clean_architecture_app/features/post/presentation/bloc/post_event.dart';
import 'package:clean_architecture_app/features/post/presentation/bloc/post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final GetPostsUseCase getPostsUseCase;
  final CreatePostUseCase createPostUseCase;
  PostBloc({required this.getPostsUseCase, required this.createPostUseCase})
    : super(PostInitialState()) {
    on<FetchPostsEvent>((event, emit) async {
      emit(PostLoadingState(posts: state.posts));

      final result = await getPostsUseCase(NoParams());
      result.fold(
        (failure) => emit(
          PostFailureState(posts: state.posts, message: failure.toString()),
        ),
        (posts) => emit(PostLoadedState(posts: posts)),
      );
    });

    on<CreatePostEvent>((event, emit) async {
      emit(PostLoadingState(posts: state.posts));

      final result = await createPostUseCase(event.post);
      result.fold(
        (failure) => emit(
          PostFailureState(posts: state.posts, message: failure.toString()),
        ),
        (post) => emit(PostLoadedState(posts: [post,...state.posts])),
      );
    });
  }
}
