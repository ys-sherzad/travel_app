import 'Tour.dart';
import 'User.dart';

class Tours {
  static List<Tour> collection = [
    new Tour(
        name: 'Thailand',
        type: 'New',
        tourCount: 18,
        rating: 4.6,
        description: '10 nights for two/all inclusive',
        price: 254.5,
        img: 'assets/images/thailand.jpg',
        users: [
          new User(profileImage: 'assets/images/person1.jpg'),
          new User(profileImage: 'assets/images/person3.jpg'),
          new User(profileImage: 'assets/images/person4.jpg'),
          new User(profileImage: 'assets/images/person2.jpg'),
          new User(profileImage: 'assets/images/person4.jpg'),
          // new User(profileImage: 'assets/images/person2.jpg'),
        ]),
    new Tour(
        name: 'Malaysia',
        type: 'Sale',
        tourCount: 12,
        rating: 4.2,
        description: '10 nights for two/all inclusive',
        price: 254.5,
        img: 'assets/images/malaysia.jpg',
        users: [
          new User(profileImage: 'assets/images/person1.jpg'),
          new User(profileImage: 'assets/images/person4.jpg'),
          new User(profileImage: 'assets/images/person3.jpg'),
        ]),
    new Tour(
        name: 'Dominica',
        type: 'Sale',
        tourCount: 5,
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
        type: 'New',
        tourCount: 9,
        rating: 4.0,
        description: '10 nights for two/all inclusive',
        price: 254.5,
        img: 'assets/images/cambodia.jpg',
        users: [
          new User(profileImage: 'assets/images/person3.jpg'),
        ]),
    new Tour(
        name: 'Vietnam',
        type: 'Sale',
        tourCount: 3,
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
