// Model data untuk komentar pengguna
class Comment {
  final String user;
  final String comment;
  final int rating;

  Comment({required this.user, required this.comment, required this.rating});

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      user: json['user'],
      comment: json['comment'],
      rating: json['rating'],
    );
  }
}
