import 'package:clean_architecture_app/features/post/domain/entity/post_entity.dart';
import 'package:dartz/dartz.dart';

abstract class PostRepository {
  Future<Either<Exception, List<PostEntity>>> getPosts();
  Future<Either<Exception, PostEntity>> createPost(PostEntity post);
}