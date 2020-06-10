import 'Tour.dart';
import 'User.dart';

class Tours {
  static List<Tour> collection = [
    new Tour(
        name: 'Thailand',
        tourCount: 12,
        rating: 4.6,
        description: '10 nights for two/all inclusive',
        price: 254.5,
        img: 'assets/images/thailand.jpg',
        users: [
          new User(profileImage: 'assets/images/person1.jpg'),
          new User(profileImage: 'assets/images/person3.jpg'),
          new User(profileImage: 'assets/images/person4.jpg'),
        ]),
    new Tour(
        name: 'Malaysia',
        tourCount: 12,
        rating: 4.2,
        description: '10 nights for two/all inclusive',
        price: 254.5,
        img: 'assets/images/malaysia.jpg',
        users: [
          new User(profileImage: 'assets/images/person1.jpg'),
          new User(profileImage: 'assets/images/person4.jpg'),
        ]),
    new Tour(
        name: 'Dominica',
        tourCount: 12,
        rating: 4.8,
        description: '10 nights for two/all inclusive',
        price: 254.5,
        img: 'assets/images/dominican.jpg',
        users: [
          new User(profileImage: 'assets/images/person2.jpg'),
          new User(profileImage: 'assets/images/person3.jpg'),
        ]),
    new Tour(
        name: 'Cambodia',
        tourCount: 12,
        rating: 4.0,
        description: '10 nights for two/all inclusive',
        price: 254.5,
        img: 'assets/images/cambodia.jpg',
        users: [
          new User(profileImage: 'assets/images/person3.jpg'),
          new User(profileImage: 'assets/images/person4.jpg'),
        ]),
    new Tour(
        name: 'Vietnam',
        tourCount: 12,
        rating: 4.1,
        description: '10 nights for two/all inclusive',
        price: 254.5,
        img: 'assets/images/vietnam.jpg',
        users: [
          new User(profileImage: 'assets/images/person1.jpg'),
          new User(profileImage: 'assets/images/person4.jpg'),
        ]),
  ];
}
