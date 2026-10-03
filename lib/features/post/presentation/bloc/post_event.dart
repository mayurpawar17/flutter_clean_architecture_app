import 'package:clean_architecture_app/features/post/domain/entity/post_entity.dart';

abstract class PostEvent {}

class FetchPostsEvent extends PostEvent {}
class CreatePostEvent extends PostEvent {
final PostEntity post;

  CreatePostEvent(this.post);
}