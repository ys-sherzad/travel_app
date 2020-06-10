import 'package:flutter/material.dart';
// import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'utils/ColorLib.dart';
import 'repo/data.dart';
import 'repo/Tour.dart';

const tourRatio = 2.1 / 3;
const cMargin = 15.0;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  void _onTabPressed(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildTourItem(List<Tour> collection, int index) {
    return AspectRatio(
      aspectRatio: tourRatio,
      child: Container(
        margin: EdgeInsets.only(right: cMargin),
        child: Stack(
          children: [
            Container(
              height: 240.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  image: DecorationImage(
                    image: AssetImage(collection[index].img),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: ColorLib.cardBackground.withOpacity(1.0),
                      spreadRadius: 2,
                      blurRadius: 9,
                      offset: Offset(0, 6),
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildHorizontalCountries() {
    return Container(
      height: 265.0,
      width: double.infinity,
      margin: EdgeInsets.only(top: 10.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: Tours.collection.length,
        padding: EdgeInsets.only(left: 12.0),
        itemBuilder: (context, index) {
          return _buildTourItem(Tours.collection, index);
        },
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 21.5),
      ),
    );
  }

  Widget _buildPopularTours() {
    // return Row(
    //   // children: Tours.collection.map((tour) => new Text('hellow').toList())
    //   children: [for (var item in Tours.collection) Text('Hellow')],
    // );
    return Column(
      children: Tours.collection.map((tour) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.blue,
          ),
          height: 100.0,
          width: double.infinity,
          margin: EdgeInsets.only(bottom: 10.0),
          child: Row(
            children: [Text('Helllow')],
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
        // textTheme: TextTheme(),
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
        selectedItemColor: ColorLib.primary,
        unselectedItemColor: ColorLib.primaryLight,
        selectedIconTheme: IconThemeData(size: 26.0),
        unselectedIconTheme: IconThemeData(size: 26.0),
        elevation: 20.0,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Ionicons.ios_home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Ionicons.ios_star),
            title: Text('Favorite'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Ionicons.ios_heart),
            title: Text('Heart'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Ionicons.ios_bonfire),
            title: Text('Dollar'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Ionicons.ios_search),
            title: Text('Search'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          // width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height,
          // color: Colors.b,
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
                    color: ColorLib.text,
                  ),
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              _buildSectionHeader('Country'),
              SizedBox(
                height: 14.0,
              ),
              _buildHorizontalCountries(),
              _buildSectionHeader('Popular Tours'),
              SizedBox(
                height: 22.0,
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
