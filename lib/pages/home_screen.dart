// import 'dart:async';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/gestures.dart';
// // import 'package:cached_network_image/cached_network_image.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:movie_booking/controllers/auth_controller.dart';
// // import 'package:flutter_catalog/controllers/location_controller.dart';
// // import 'package:flutter_catalog/pages/profile_screen.dart';
// // import 'package:flutter_catalog/pages/select_location_screen.dart';
// // import 'package:flutter_catalog/utils/dummy_data.dart';
// import 'package:movie_booking/utils/mytheme.dart';
// import 'package:get/get.dart';

// import '../controllers/auth_controller.dart';
// // import '../utils/custom_slider.dart';
// // import '../utils/dummy_data.dart';
// // import '../utils/event_items.dart';
// // import '../utils/menu_item.dart';
// // import '../utils/movies_item.dart';
// import '../utils/mytheme.dart';
// // import '../utils/constants.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   // String city = cities[0];
//   // final Completer <GoogleMapController> _controller = Completer();

//   // static const CameraPosition _kGooglePlex = CameraPosition(
//   //   target: LatLng(37.42796133580664, -122.085749655962),
//   //   zoom: 14.4746,
//   // );

//   // @override
//   // void initState() {
//   //   SharedPref.getLocation().then((value) => LocationController.instance.setCity(value));
//   //   super.initState();
//   // }

//   // static const CameraPosition _kLake =
//   //     CameraPosition(bearing: 192.8334901395799, target: LatLng(37.43296265331129, -122.08832357078792), tilt: 59.440717697143555, zoom: 19.151926040649414);
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: MyTheme.statusBar));
//     String? picUrl = AuthController.instance.user!.photoURL;
//     // picUrl = picUrl ?? Constants.dummyAvatar;
//     return SafeArea(
//       child: Scaffold(
//         appBar: PreferredSize(
//           preferredSize: const Size.fromHeight(70),
//           child: AppBar(
//             leading: Padding(
//               padding: const EdgeInsets.only(left: 8, top: 8),
//               child: GestureDetector(
//                 onTap: () {
//                   // Get.to(() => const ProfileScreen());
//                 },
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(30),
//                   // child: CachedNetworkImage(
//                   //   fit: BoxFit.cover,
//                   //   // imageUrl: picUrl,
//                   //   height: 60,
//                   //   width: 60,
//                   // ),
//                 ),
//               ),
//             ),

//             title: Padding(
//               padding: const EdgeInsets.only(top: 5.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(AuthController.instance.user!.displayName ?? "Name"),
//                   GestureDetector(
//                     onTap: () {
//                       // Get.to(() => const SelectionLocationScreen());
//                     },
//                     child: Row(
//                       children: [
//                         Obx(
//                           () => Text(
//                             LocationController.instance.city.value,
//                             style: TextStyle(color: Colors.white.withOpacity(0.7), inherit: true, fontSize: 14),
//                           ),
//                         ),
//                         Icon(Icons.keyboard_arrow_down, color: Colors.white.withOpacity(0.7)),
//                       ],
//           ),
//         ),
//       ],
//       ),
//     ),
//           ),
  
//         ),
//       ),
//     );

    
    

//   }
// }

import 'package:flutter/material.dart';
import 'package:movie_booking/controllers/auth_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            AuthController.instance.signOut();
          },
          child: Center(
            child: Text("Logout"),
        ))),
    );
  }
}
