// import 'package:flutter/material.dart';
// import 'package:framed_by/pages/user/tabs/book_now.dart';
// import 'package:framed_by/pages/user/tabs/notification_page.dart';
// import 'package:framed_by/pages/user/tabs/profile.dart';
// import 'package:get/get.dart';
// import 'package:framed_by/pages/auth_checker.dart';
// import 'package:framed_by/services/services.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';

// class HomePage extends StatelessWidget {
//   AuthService authService = AuthService();
//   HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.amber,
//         elevation: 8,
//         title: const Text("Framed By"),
//         actions: [
//           IconButton(
//               onPressed: () async {
//                 await authService.removeToken();
//                 Get.to(const AuthChecker());
//               },
//               icon: const Icon(Icons.logout)),
//         ],
//       ),

//       // ignore: prefer_const_constructors
//       bottomNavigationBar: Container(
//         color: Colors.black,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
//           child: GNav(
//             backgroundColor: Colors.black,
//             activeColor: Colors.white,
//             color: Colors.white,
//             tabBackgroundColor: Colors.grey.shade800,
//             padding: const EdgeInsets.all(15),
//             gap: 5,
//             tabs: const [
//               GButton(
//                 icon: Icons.home,
//                 text: 'Home',
//               ),
//               GButton(
//                 icon: Icons.add,
//                 text: 'Book Now',
//               ),
//               GButton(
//                 icon: Icons.notifications,
//                 text: 'Notifications',
//               ),
//               GButton(
//                 icon: Icons.person,
//                 text: 'Profile',
//               ),
//             ],
//           ),
//         ),
//       ),

//       // bottomNavigationBar: BottomNavigationBar(
//       //   backgroundColor:
//       //       Colors.blue, // sets the background color of the BottomNavigationBar
//       //   selectedItemColor:
//       //       Colors.black, // sets the color of the selected menu item
//       //   unselectedItemColor:
//       //       Colors.red, // sets the color of the unselected menu items

//       //   items: const [
//       //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//       //     BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
//       //     BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Book'),
//       //     BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
//       //   ],
//       // ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:framed_by/pages/admin/edit_category_page.dart';
import 'package:get/get.dart';
import 'package:framed_by/components/card_button.dart';

import '../add_freelancers.dart';

// import 'package:framed_by/pages/admin/add_merchant.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Home"),
      ),
      body: Wrap(
        children: [
          Cardbutton(
            lable: "Add Freelancers",
            size: 48.0,
            onTap: () {
              Get.bottomSheet(AddMerchant());
            },
          ),
          Cardbutton(
            lable: "Edit Category",
            size: 48.0,
            onTap: () {
              Get.bottomSheet(const EditCategoryPage());
            },
          ),
        ],
      ),
    );
  }
}
