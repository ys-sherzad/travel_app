import 'package:flutter/material.dart';
// import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'utils/ColorLib.dart';

const ratio = 3 / 4.5;
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

  Widget _buildCountryItem(bool extraPadding) {
    return Stack(
      children: [
        Container(
          height: 240.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              image: DecorationImage(
                image: AssetImage('assets/images/thailand.jpg'),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: ColorLib.cardBackground.withOpacity(0.8),
                  spreadRadius: 2,
                  blurRadius: 9,
                  offset: Offset(0, 9),
                )
              ]),
          margin: EdgeInsets.only(right: cMargin, top: 10.0, bottom: 10.0),
          // margin: EdgeInsets.fromLTRB(16.0, 0.0, cMargin, 0.0),
        )
      ],
    );
  }

  Widget _buildHorizontalCountries() {
    return Container(
      height: 280.0,
      // width: double.infinity,
      // margin: EdgeInsets.only(bottom: 50.0),
      // color: Colors.blue,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(
            width: 10.0,
          ),
          AspectRatio(
            aspectRatio: ratio,
            child: _buildCountryItem(true),
          ),
          AspectRatio(
            aspectRatio: ratio,
            child: _buildCountryItem(false),
          ),
          AspectRatio(
            aspectRatio: ratio,
            child: _buildCountryItem(false),
          ),
          AspectRatio(
            aspectRatio: ratio,
            child: _buildCountryItem(false),
          ),
          AspectRatio(
            aspectRatio: ratio,
            child: _buildCountryItem(false),
          ),
        ],
      ),
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
            children: [
              SizedBox(
                height: 18.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                alignment: Alignment.topLeft,
                child: Text(
                  'Find the best tour',
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: 18.0,
              ),
              _buildHorizontalCountries(),
            ],
          ),
        ),
      ),
    );
  }
}
