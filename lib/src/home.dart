import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'utils/ColorLib.dart';
import 'repo/Tours.dart';
import 'repo/User.dart';
import 'repo/Tour.dart';
import 'dart:ui';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  void _onTabPressed(int index) {}

  // overlapped avatars in the horizontal Tours list
  Widget _buildStackedAvatars(List<User> users) {
    return Expanded(
      child: Container(
        child: Stack(
          alignment: Alignment.center,
          children: List.generate(
            users.length,
            (index) {
              return Positioned(
                right: index * 18.0,
                child: CircleAvatar(
                  radius: 13.0,
                  backgroundImage: AssetImage(users[index].profileImage),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSingleAvatar(List<User> users) {
    return Align(
      alignment: Alignment.centerRight,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: Colors.grey[50].withOpacity(0.25),
            ),
            child: Row(children: [
              CircleAvatar(
                radius: 14.0,
                backgroundImage: AssetImage(users[0].profileImage),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0, left: 6.0),
                child: Text(
                  '+${users.length - 1}',
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Widget _buildHorizontalTourItem(List<Tour> collection, int index) {
    var boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20.0),
      image: DecorationImage(
        image: AssetImage(collection[index].img),
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(
          Colors.black.withOpacity(0.18),
          BlendMode.srcOver,
        ),
      ),
      boxShadow: [
        BoxShadow(
          color: ColorLib.light.withOpacity(0.3),
          spreadRadius: 2,
          blurRadius: 8,
          offset: Offset(0, 5),
        )
      ],
    );
    return AspectRatio(
      aspectRatio: 1 / 1.3,
      child: Container(
        margin: EdgeInsets.only(right: 14.0),
        padding: EdgeInsets.all(16.0),
        decoration: boxDecoration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 28.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                      child: Container(
                        width: 50.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[50].withOpacity(0.3)),
                        child: Center(
                          child: Text(
                            collection[index].type,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 14.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  collection[index].users.length > 3
                      ? _buildSingleAvatar(collection[index].users)
                      : _buildStackedAvatars(collection[index].users)
                ],
              ),
            ),
            Container(
              height: 58.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        collection[index].name,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.45,
                        ),
                      ),
                      Text(
                        '${collection[index].tourCount.toString()} Tours',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                      child: Container(
                        height: double.infinity,
                        width: 28.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.grey[50].withOpacity(0.3),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                collection[index].rating.toString(),
                                style: TextStyle(
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              Icon(
                                AntDesign.star,
                                size: 15.0,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHorizontalList() {
    return Container(
      height: 260.0,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: Tours.collection.length,
        padding: EdgeInsets.only(left: 15.0, top: 15.0, bottom: 15.0),
        itemBuilder: (context, index) {
          return _buildHorizontalTourItem(Tours.collection, index);
        },
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.w700, fontSize: 21.5, color: ColorLib.text),
      ),
    );
  }

  Widget _buildPopularTours() {
    return Column(
      children: Tours.collection.map((tour) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: ColorLib.cardBackground),
          height: 95.0,
          width: double.infinity,
          margin: EdgeInsets.only(bottom: 14.0),
          child: Row(
            children: [
              Container(
                height: double.infinity,
                width: 105.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25.0),
                      topLeft: Radius.circular(25.0)),
                  image: DecorationImage(
                    image: AssetImage(tour.img),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.1),
                      BlendMode.srcOver,
                    ),
                  ),
                ),
                child: null,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 2.0, bottom: 2.0, right: 16.0, left: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tour.name,
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w800,
                                  color: ColorLib.text),
                            ),
                            SizedBox(
                              height: 4.0,
                            ),
                            Text(
                              tour.description,
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                  color: ColorLib.text.withOpacity(0.6)),
                            ),
                            SizedBox(
                              height: 4.0,
                            ),
                            Text(
                              '\$ ${tour.price.toString()}',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w800,
                                  color: ColorLib.text),
                            ),
                          ],
                        )),
                      ),
                      Container(
                        height: 58.0,
                        width: 28.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: ColorLib.accent,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                tour.rating.toString(),
                                style: TextStyle(
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              Icon(
                                AntDesign.star,
                                size: 15.0,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('DiscountTour'),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Ionicons.ios_menu),
          iconSize: 28.0,
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: ColorLib.primary, size: 30.0),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTabPressed,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: ColorLib.accent,
        unselectedItemColor: ColorLib.light,
        selectedIconTheme: IconThemeData(size: 26.0),
        unselectedIconTheme: IconThemeData(size: 26.0),
        elevation: 20.0,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Feather.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Feather.star),
            title: Text('Favorite'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Feather.heart),
            title: Text('Heart'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Feather.box),
            title: Text('Dollar'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Feather.search),
            title: Text('Search'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 18.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                alignment: Alignment.topLeft,
                child: Text(
                  'Find the best tour',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700,
                    color: ColorLib.primary,
                  ),
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
              _buildSectionHeader('Country'),
              SizedBox(
                height: 4.0,
              ),
              _buildHorizontalList(),
              SizedBox(
                height: 6.0,
              ),
              _buildSectionHeader('Popular Tours'),
              SizedBox(
                height: 18.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: _buildPopularTours(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
