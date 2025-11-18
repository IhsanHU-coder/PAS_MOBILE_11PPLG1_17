import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_17/controller/btn_nav_controller.dart';
import 'package:pas_mobile_11pplg1_17/controller/login_api_controller.dart';
import 'package:pas_mobile_11pplg1_17/pages/Potrait/profile_page.dart';
import 'package:pas_mobile_11pplg1_17/pages/contact_page.dart';
import 'package:pas_mobile_11pplg1_17/pages/data_product_page.dart';
import 'package:pas_mobile_11pplg1_17/pages/dog_data_page.dart';
import 'package:pas_mobile_11pplg1_17/pages/premiere_table_page.dart';


class BtnNavPage extends StatelessWidget {
  BtnNavPage({super.key});

  final BtnNavController controller = Get.find<BtnNavController>();
  final LoginApiController loginapicontroller = Get.find<LoginApiController>();

  final List<Widget> pages = [
    // DogDataPage(),
    // PremiereTablePage(),
    // ContactPage(),
    DataProductPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    print("btnNav Dibuka");
    return Obx(() => Scaffold(
      
          appBar: AppBar(
            title: const Text("My App"),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(color: Colors.blue),
                  child: Text(
                    "Menu",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
                // ListTile(
                //   leading: const Icon(Icons.calculate),
                //   title: const Text("Dog Data API"),
                //   onTap: () {
                //     controller.changeTab(0);
                //     Get.back();
                //   },
                // ),
                // ListTile(
                //   leading: const Icon(Icons.contact_page),
                //   title: const Text("Premiere League Table"),
                //   onTap: () {
                //     controller.changeTab(1);
                //     Get.back();
                //   },
                // ),
                // ListTile(
                //   leading: const Icon(Icons.contact_page),
                //   title: const Text("Contact Page"),
                //   onTap: () {
                //     controller.changeTab(2);
                //     Get.back();
                //   },
                // ),
                ListTile(
                  leading: const Icon(Icons.contact_page),
                  title: const Text("Data Product Page"),
                  onTap: () {
                    controller.changeTab(0);
                    Get.back();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.contact_page),
                  title: const Text("Profile Page"),
                  onTap: () {
                    controller.changeTab(1);
                    Get.back();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.red),
                  title: const Text(
                    "Logout",
                    style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    loginapicontroller.logout();
                  },
                ),
              ],
            ),
          ),

          //Yang bawah
          body: pages[controller.currentIndex.value],

          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            onTap: controller.changeTab,
            items: const [
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.calculate),
              //   label: "Dog Data API",
              // ),
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.add_circle_sharp),
              //   label: "Premiere League Table",
              // ),
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.contact_page),
              //   label: "Contact Page",
              // ),
              BottomNavigationBarItem(
                icon: Icon(Icons.contact_page),
                label: "Data Product Page",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.contact_page),
                label: "Profile Page",
              ),
            ],
          ),
        ));
  }
}
