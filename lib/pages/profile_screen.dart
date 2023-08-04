import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:movie_booking/controllers/auth_controller.dart';
import 'package:movie_booking/controllers/profile_controller.dart';
import 'package:movie_booking/utils/constants.dart';
import 'package:movie_booking/utils/mytheme.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProfileScreen extends StatefulWidget {
  void dependencies() {
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
  }
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: MyTheme.appBarColor));
    String? picUrl = AuthController.instance.user!.photoURL;
    picUrl = picUrl ?? Constants.dummyAvatar;
    // String? name = AuthController.instance.user!.displayName ?? "NO Name";
    // String? email = AuthController.instance.user!.email;
    // String? mobile = AuthController.instance.user!.phoneNumber ?? "0000000000";
    // mobileController.text = mobile;
    // nameController.text = name;
    // emailController.text = email.toString();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Stack(
          children: [
            Container(
              height: 150,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                color: MyTheme.appBarColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30)
                )
              ),
            ),
            NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {
                  // _animationController.forward();
                } else if (notification.metrics.pixels == notification.metrics.minScrollExtent * 0.5) {
                  // _animationController.reverse();
                }
                print(notification.metrics.pixels);
                return true;
              },
            child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 150,
                      width: double.maxFinite,
                      decoration: const BoxDecoration(
                        color: MyTheme.appBarColor,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 70.0),
                      child: Text("Name"),
                    ),
               
              
                     Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0,),
                        child: 
                     TextFormField(
                          // readOnly: ProfileController.instance.isEdit.value,
                          // // initialValue: name,
                          // style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color(0xFFE4EDFF),
                                ),
                                child: const Icon(
                                  Icons.person_outline,
                                  color: Color(0xFF4C7EFF),
                                ),
                              ),
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                // ProfileController.instance.toggleEdit();
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Icon(
                                  Icons.edit_outlined,
                                  color: Color(0xFF4C7EFF),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                                     
              
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 70.0),
                      child: Text("Email"),
                    ),
              
              
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,),
                      child: TextFormField(
                        // initialValue: email,
                        readOnly: true,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color(0xFFE4EDFF),
                              ),
                              child: const Icon(
                                Icons.email_outlined,
                                color: Color(0xFFCC80EA),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),                  
                    
              
                          const SizedBox(
                            height: 10,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 70.0),
                            child: Text("Mobile"),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0,),
                            child: TextFormField(
                              // initialValue: mobile,
                              // readOnly: ProfileController.instance.isEdit.value,
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: const Color(0xFFCCEFE0),
                                    ),
                                    child: const Icon(
                                      Icons.phone_android_outlined,
                                      color: Color(0xFF48EB9F),
                                    ),
                                  ),
                                ),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    // ProfileController.instance.toggleEdit();
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.all(4.0),
                                    child: Icon(
                                      Icons.edit_outlined,
                                      color: Color(0xFF4C7EFF),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                            
                          const Divider(
                            thickness: 1,
                            color: MyTheme.greyColor,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: Text('DOCUMENTATION'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: ListTile(
                              leading: const Icon(
                                Icons.privacy_tip_outlined,
                                size: 20,
                              ),
                              title: const Text(
                                'Privacy Policy',
                                style: TextStyle(color: Colors.black),
                              ),
                              onTap: () {},
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: ListTile(
                              leading: const Icon(
                                Icons.share,
                                size: 20,
                              ),
                              title: const Text(
                                'Share',
                                style: TextStyle(color: Colors.black),
                              ),
                              onTap: () {},
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: ListTile(
                              leading: const Icon(
                                Icons.logout_outlined,
                                size: 20,
                                color: Colors.red,
                              ),
                              title: const Text(
                                'Logout',
                                style: TextStyle(color: Colors.red),
                              ),
                              onTap: () {
                                // AuthController.instance.signOut();
                              },
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    ),
            ),
                  
                  Positioned( 
                    top: 90,
                    left: MediaQuery.of(context).size.width * 0.5 - 60,
                    child: Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white, width: 3),
                                  borderRadius: BorderRadius.circular(60),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(60),
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl: picUrl,
                                    height: 120,
                                    width: 120,
                                  ),
                                ),
                              ), 
                            ),
                  ),
                  
                          
                    
                
                  Positioned(
                    top: 170,
                    left: MediaQuery.of(context).size.width * 0.5 + 20,
                    // child: SlideTransition(
                    // position: _animationCamera,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: MyTheme.appBarColor,
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                      ),
                    ),
                  )
          ],
        ),
                  
      
      
        ),
      );
    
  }
}
