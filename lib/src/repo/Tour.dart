import 'User.dart';

class Tour {
  final String name;
  final int tourCount;
  final double rating;
  final String description;
  final double price;
  final String img;
  final List<User> users;

  Tour(
      {this.name,
      this.tourCount,
      this.rating,
      this.description,
      this.price,
      this.img,
      this.users});
}
