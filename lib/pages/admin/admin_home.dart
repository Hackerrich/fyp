import 'dart:async';

import 'package:flutter/material.dart';
import 'package:framed_by/pages/admin/tabs/book_now.dart';
import 'package:tabnavigator/tabnavigator.dart';
import 'package:framed_by/pages/admin/tabs/home_page.dart';
import 'package:framed_by/pages/admin/tabs/profile.dart';
import 'package:framed_by/pages/admin/tabs/notification_page.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({
    Key? key,
  }) : super(key: key);

  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  final _tabController = StreamController<AppTab>.broadcast();
  final _initTab = AppTab.home;

  Stream<AppTab> get tabStream => _tabController.stream;

  final _map = <AppTab, TabBuilder>{
    AppTab.report: () {
      return Report();
    },
    AppTab.home: () {
      return const Home();
    },
    AppTab.profile: () {
      return const Profile();
    }
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
          selectedItemColor: Colors.black,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.feedback),
              label: 'Merchant',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
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

  static const report = AppTab._(0);
  static const home = AppTab._(1);
  static const profile = AppTab._(2);

  static AppTab byValue(int value) {
    switch (value) {
      case 0:
        return report;
      case 1:
        return home;
      case 2:
        return profile;
      default:
        throw Exception('no tab for such value');
    }
  }
}
