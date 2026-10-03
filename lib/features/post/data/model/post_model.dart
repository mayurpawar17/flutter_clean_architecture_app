import 'package:clean_architecture_app/features/post/domain/entity/post_entity.dart';

class PostModel extends PostEntity {
  
  PostModel({
    required super.id,
    required super.title,
    required super.body,
  });


  factory PostModel.fromEntity(PostEntity entity) {
    return PostModel(
      id: entity.id ?? 0,
      title: entity.title ?? '',
      body: entity.body ?? '',
    );
  }



  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
    };
  }
}