import 'package:clean_architecture_app/core/usecase/usecase.dart';
import 'package:clean_architecture_app/features/post/domain/entity/post_entity.dart';
import 'package:clean_architecture_app/features/post/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';

class GetPostsUseCase extends UseCase<List<PostEntity>, NoParams> {
  final PostRepository repository;

  GetPostsUseCase(this.repository);

  @override
  Future<Either<Exception, List<PostEntity>>> call(NoParams params) async {
    return await repository.getPosts();
  }
}