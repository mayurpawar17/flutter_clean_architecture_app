import 'dart:convert';

import 'package:clean_architecture_app/core/network/api_client.dart';
import 'package:clean_architecture_app/features/post/data/model/post_model.dart';
import 'package:dartz/dartz.dart';

abstract class PostRemoteDataSource {
  Future<Either<Exception, List<PostModel>>> getPosts();
  Future<Either<Exception, PostModel>> createPost(PostModel post);
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final ApiClient apiClient;
  PostRemoteDataSourceImpl(this.apiClient);
  @override
  Future<Either<Exception, List<PostModel>>> getPosts() async {
    try {
      final response = await apiClient.dio.get('/posts');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        final List<PostModel> posts = data
            .map((json) => PostModel.fromJson(json))
            .toList();
        return Right(posts);
      } else {
        return Left(Exception('Failed to load posts'));
      }

      //     await apiClient.dio.get('/posts').then((response) {
      //   if (response.statusCode == 200) {
      //     final List<dynamic> data = response.data;
      //     final List<PostModel> posts = data
      //         .map((json) => PostModel.fromJson(json))
      //         .toList();
      //     return Right(posts);
      //   } else {
      //     return Left(Exception('Failed to load posts'));
      //   }
      // });
    } catch (e) {
      return Left(Exception('Failed to load posts: $e'));
    }
    // return apiClient.dio.get(data:'/posts');
  }

  @override
  Future<Either<Exception, PostModel>> createPost(PostModel post) async {
    try {
      final response = await apiClient.dio.post('/posts', data: jsonEncode(post.toJson()));
      if (response.statusCode == 201) {
        final PostModel createdPost = PostModel.fromJson(response.data);
        return Right(createdPost);
      } else {
        return Left(Exception('Failed to create post'));
      }

      //  return apiClient.dio.post('/posts', data: post.toJson()).then((response) {
      //   if (response.statusCode == 201) {
      //     final PostModel createdPost = PostModel.fromJson(response.data);
      //     return Right(createdPost);
      //   } else {
      //     return Left(Exception('Failed to create post'));
      //   }
      // });
    } catch (e) {
      return Left(Exception('Failed to create post: $e'));
    }
  }
}
