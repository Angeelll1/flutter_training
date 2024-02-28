class ProductModel {
  String? userId;
  String? id;
  String? title;
  String? completed;

  ProductModel({this.userId, this.id, this.title, this.completed});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        userId: json['userId'].toString(),
        id: json['id'].toString(),
        title: json['title'],
        completed: json['completed'].toString());
  }
}
