class PostModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  PostModel({
    this.userId, 
    this.id, 
    this.title, 
    this.body
    });

  ///////////////parse map to model///////////////
  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        userId: json['userId'] as int?,
        id: json['id'] as int?,
        title: json['title'] as String?,
        body: json['body'] as String?,
      );
/////////model to json and use to (chaching /post/put...)///////////
  Map<String, dynamic> toJson() => {
        'userId': userId,
        'id': id,
        'title': title,
        'body': body,
      };
}
