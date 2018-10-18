class Post {
  final int userId;
  final int id;
  final String title;
  final String body;
  final String imageUrl;

  Post({this.userId, this.id, this.title, this.body, this.imageUrl});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
      imageUrl: json['image_url']
    );
  }
}