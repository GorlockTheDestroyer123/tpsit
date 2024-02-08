
import 'package:floor/floor.dart';
import 'post.dart';

@dao
abstract class PostDao {
  @insert
  Future<void> insertPost(Post post);

  @update
  Future<void> updatePost(Post post);

  @delete
  Future<void> deletePost(Post post);
}
