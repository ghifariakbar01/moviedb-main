//make class Favorit with title, description, and image
class Favorit {
  String title;
  String description;
  String image;

  Favorit(
      {required this.title, required this.description, required this.image});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    return data;
  }
}
