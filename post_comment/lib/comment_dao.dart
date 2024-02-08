
import 'package:floor/floor.dart';
import 'comment.dart';

@dao
abstract class CommentDao {
  @insert
  Future<void> insertComment(Comment comment);

  @update
  Future<void> updateComment(Comment comment);

  @delete
  Future<void> deleteComment(Comment comment);
}
