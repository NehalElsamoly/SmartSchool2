import 'package:meta/meta.dart';

class PostsModel {
  final bool isSuccess;
  final int status;
  final List<Post> posts;

  PostsModel({
    required this.isSuccess,
    required this.status,
    required this.posts,
  });

  factory PostsModel.fromJson(Map<String, dynamic> json) {
    return PostsModel(
      isSuccess: json['IsSuccess'],
      status: json['Status'],
      posts: (json['posts'] as List<dynamic>)
          .map((postJson) => Post.fromJson(postJson))
          .toList(),
    );
  }
}

class Post {
  final String content;
  final int totalComments;
  final int totalReactions;
  final String createdAt;
  final List<Comment> comments;
  final List<Reaction> reactions;
  final List<Photo> photos;

  Post({
    required this.content,
    required this.totalComments,
    required this.totalReactions,
    required this.createdAt,
    required this.comments,
    required this.reactions,
    required this.photos,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      content: json['content'],
      totalComments: json['total_comments'],
      totalReactions: json['total_reactions'],
      createdAt: json['created_at'],
      comments: (json['comments'] as List<dynamic>? ?? [])
          .map((commentJson) => Comment.fromJson(commentJson))
          .toList(),
      reactions: (json['reactions'] as List<dynamic>? ?? [])
          .map((reactionJson) => Reaction.fromJson(reactionJson))
          .toList(),
      photos: (json['photos'] as List<dynamic>? ?? [])
          .map((photoJson) => Photo.fromJson(photoJson))
          .toList(),
    );
  }
}

class Comment {
  final String username;
  final String email;
  final String comment;
  final String createdAt;

  Comment({
    required this.username,
    required this.email,
    required this.comment,
    required this.createdAt,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      username: json['username'],
      email: json['email'],
      comment: json['comment'],
      createdAt: json['created_at'],
    );
  }
}

class Reaction {
  final String username;
  final String email;
  final String createdAt;

  Reaction({
    required this.username,
    required this.email,
    required this.createdAt,
  });

  factory Reaction.fromJson(Map<String, dynamic> json) {
    return Reaction(
      username: json['username'],
      email: json['email'],
      createdAt: json['created_at'],
    );
  }
}

class Photo {
  final String name;

  Photo({
    required this.name,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      name: json['name'],
    );
  }
}
