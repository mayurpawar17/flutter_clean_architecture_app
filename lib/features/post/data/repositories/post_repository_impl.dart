import 'package:clean_architecture_app/features/post/data/model/post_model.dart';
import 'package:clean_architecture_app/features/post/data/remoteDataSource/post_remote_data_source.dart';
import 'package:clean_architecture_app/features/post/domain/entity/post_entity.dart';
import 'package:clean_architecture_app/features/post/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remoteDataSource;

  PostRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Exception, List<PostModel>>> getPosts() {
    return remoteDataSource.getPosts();
  }

  @override
  Future<Either<Exception, PostModel>> createPost(PostEntity post) {
    return remoteDataSource.createPost(PostModel.fromEntity(post));
  }
}
