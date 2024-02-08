import 'package:floor/floor.dart';
import 'post.dart'; // Assicurati di importare la classe Post

@Entity(
  tableName: 'comments',
  foreignKeys: [
    ForeignKey(
      childColumns: ['postId'],
      parentColumns: ['id'],
      entity: Post, // Utilizza la classe importata Post
      onDelete: ForeignKeyAction.cascade,
    ),
  ],
)
class Comment {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  @ColumnInfo(name: 'postId')
  final int postId;

  final String message;

  Comment({this.id, required this.postId, required this.message});
}
