class PostModel {
  final int id;
  final String title;
  final String body;
  final List<String> tags;
  final int likes;
  final int dislikes;
  final int views;
  final int userId;

  PostModel({
    required this.id,
    required this.title,
    required this.body,
    required this.tags,
    required this.likes,
    required this.dislikes,
    required this.views,
    required this.userId,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      tags: List<String>.from(json['tags']),
      likes: json['reactions']['likes'],
      dislikes: json['reactions']['dislikes'],
      views: json['views'],
      userId: json['userId'],
    );
  }

  String get userName => 'User $userId';
  String get userHandle => '@user$userId';
  String get avatarUrl => 'https://i.pravatar.cc/150?img=$userId';
  String get imageUrl => 'https://picsum.photos/seed/$id/400/200';
  String get timestamp => '${id}h';
  bool get isReposted => id % 3 == 0;
}