import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_17/controller/login_api_controller.dart';
import 'package:pas_mobile_11pplg1_17/controller/register_api_controller.dart';
import 'package:pas_mobile_11pplg1_17/widgets/widget_button.dart';
import 'package:pas_mobile_11pplg1_17/widgets/widget_textfield.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final LoginApiController controller = Get.find<LoginApiController>();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Foto profil (ganti assetnya sesuai punyamu)
            const CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                "https://yt3.googleusercontent.com/ytc/AIdro_nugqGzCgoJ4yJH_GvzHthV66mx3quWJ8niMGBF03wOcA=s160-c-k-c0x00ffffff-no-rj",
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Ihsan",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "Absen: 17",
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            
            CustomField(textEditingController: controller.usernameController, labelText: "User", obscureText: false, hintText: "user"),
            
            CustomButton(text: "Logout", textColour: Colors.red, onPressed: (){
              controller.logout();
            })
          ],
        ),
      ),
    );
  }
}