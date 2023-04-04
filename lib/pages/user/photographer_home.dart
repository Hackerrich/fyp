import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tabnavigator/tabnavigator.dart';
import 'package:framed_by/pages/freelancers/tabs/bookings.dart';
import 'package:framed_by/pages/freelancers/tabs/home.dart';
import 'package:framed_by/pages/admin/tabs/profile.dart';

class MerchantHome extends StatefulWidget {
  const MerchantHome({
    Key? key,
  }) : super(key: key);

  @override
  _MerchantHomeState createState() => _MerchantHomeState();
}

class _MerchantHomeState extends State<MerchantHome> {
  final _tabController = StreamController<AppTab>.broadcast();
  final _initTab = AppTab.home;

  Stream<AppTab> get tabStream => _tabController.stream;

  final _map = <AppTab, TabBuilder>{
    AppTab.report: () {
      return const Booking();
    },
    AppTab.home: () {
      return const Home();
    },
    AppTab.profile: () {
      return const Profile(
        isFreelancers: true,
      );
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
          selectedItemColor: Colors.orange,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.feedback),
              label: 'Report',
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
