class Post {
  final int id;
  final String title;
  final String body;
  final int userId;
  final String tags;
  final int reactions;

  Post({
    required this.id,
    required this.title,
    required this.body,
    required this.userId,
    required this.tags,
    required this.reactions,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        id: json["id"],
        title: json["title"],
        body: json["body"],
        userId: json["userId"],
        tags: json["tags"].toString(),
        reactions: json["reactions"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "body": body,
      "userId": userId,
      "tags": tags,
      "reactions": reactions,
    };
  }
}
