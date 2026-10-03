import 'package:equatable/equatable.dart';

class PostEntity extends Equatable {
  int? userId;
  int? id;
  String? title;
  String? body;

  PostEntity({this.userId, this.id, this.title, this.body});

  @override
  List<Object?> get props => [userId, id, title, body];
}
