import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:viewster/provider/FavoritesProvider.dart';
import 'package:viewster/screens/FavoriteMovies.dart';
import 'package:viewster/screens/FavoriteShows.dart';
import 'package:viewster/screens/Home.dart';
import 'package:viewster/screens/Profile.dart';
import 'package:viewster/firebase/Functions.dart' as FirebaseFunctions;

class BottomNavigator extends StatefulWidget {
  @override
  _BottomNavigatorState createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int currentIndex = 0;

  List<Widget> screenList = [
    Home(),
    FavoriteShows(),
    FavoriteMovies(),
    Profile()
  ];

  void initProvider() async {
    Map res = await FirebaseFunctions.getDataFromFirestore();
    Provider.of<FavoritesProvider>(context, listen: false)
        .initFavs(res['favoriteMovies'], res['favoriteShows']);
  }

  @override
  void initState() {
    super.initState();
    initProvider();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: screenList[currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.orange,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_movies),
            title: Text("Shows"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            title: Text("Movies"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text("Account"),
          ),
        ],
      ),
    );
  }
}
