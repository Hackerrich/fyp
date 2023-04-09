import 'dart:async';

import 'package:flutter/material.dart';

import 'package:tabnavigator/tabnavigator.dart';
import 'package:framed_by/pages/freelancers/tabs/add_post.dart';
import 'package:framed_by/pages/freelancers/tabs/home.dart';
import 'package:framed_by/pages/freelancers/tabs/profile.dart';
import 'package:framed_by/pages/freelancers/tabs/favorite.dart';

class FreelancersHome extends StatefulWidget {
  const FreelancersHome({
    Key? key,
  }) : super(key: key);

  @override
  _FreelancerHomeState createState() => _FreelancerHomeState();
}

class _FreelancerHomeState extends State<FreelancersHome> {
  final _tabController = StreamController<AppTab>.broadcast();
  final _initTab = AppTab.home;

  Stream<AppTab> get tabStream => _tabController.stream;

  final _map = <AppTab, TabBuilder>{
    AppTab.home: () {
      return const Home();
    },
    AppTab.add_post: () {
      return const Add_post();
    },
    AppTab.favorite: () {
      return const Favorite();
    },
    AppTab.profile: () {
      return const Profile();
    },
  };

  Widget _buildBody() {
    return TabNavigator(
      initialTab: _initTab,
      selectedTabStream: tabStream,
      mappedTabs: _map,
    );
  }

  Widget _buildbottomNavigationBar() {
    return StreamBuilder<AppTab>(
      stream: tabStream,
      initialData: _initTab,
      builder: (context, snapshot) {
        return BottomNavigationBar(
          backgroundColor: Colors.blueGrey,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.red,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Add Post',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: snapshot.hasData ? snapshot.data!.value : 0,
          onTap: (value) => _tabController.sink.add(AppTab.byValue(value)),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _buildbottomNavigationBar(),
    );
  }

  @override
  void dispose() {
    _tabController.close();
    super.dispose();
  }
}

class AppTab extends TabType {
  const AppTab._(int value) : super(value);

  static const home = AppTab._(0);
  // ignore: constant_identifier_names
  static const add_post = AppTab._(1);
  static const favorite = AppTab._(2);
  static const profile = AppTab._(3);

  static AppTab byValue(int value) {
    switch (value) {
      case 0:
        return home;
      case 1:
        return add_post;
      case 2:
        return favorite;
      case 3:
        return profile;
      default:
        throw Exception('no tab for such value');
    }
  }
}
