import 'package:clean_architecture_app/core/usecase/usecase.dart';
import 'package:clean_architecture_app/features/post/domain/entity/post_entity.dart';
import 'package:clean_architecture_app/features/post/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';

class CreatePostUseCase extends UseCase<PostEntity, PostEntity> {
  final PostRepository repository;

  CreatePostUseCase(this.repository);

  @override
  Future<Either<Exception, PostEntity>> call(PostEntity params) async {
    return await repository.createPost(params);
  }
}