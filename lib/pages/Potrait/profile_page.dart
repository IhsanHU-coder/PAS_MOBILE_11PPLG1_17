import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_17/controller/login_api_controller.dart';
import 'package:pas_mobile_11pplg1_17/widgets/widget_button.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final LoginApiController controller = Get.find<LoginApiController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 245, 245, 245),
        elevation: 2,
      ),
      body: Center(
        child: Obx(() => SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Profile Picture
              CircleAvatar(
                radius: 70,
                backgroundColor: Colors.green[200],
                child: ClipOval(
                  child: Image.network(
                    "https://yt3.googleusercontent.com/ytc/AIdro_nugqGzCgoJ4yJH_GvzHthV66mx3quWJ8niMGBF03wOcA=s160-c-k-c0x00ffffff-no-rj",
                    width: 130,
                    height: 130,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Info Card
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      InfoRow(label: "Username", value: controller.savedUsername.value),
                      InfoRow(label: "Email", value: controller.savedEmail.value),
                      InfoRow(label: "Fullname", value: controller.savedFullname.value),
                      InfoRow(label: "Password", value: controller.savedPassword.value, valueColor: Colors.red),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Logout Button
              SizedBox(
  width: 200,
  child: ElevatedButton(
    onPressed: () => controller.logout(),
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.red, // background color
      padding: const EdgeInsets.symmetric(vertical: 14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    child: const Text(
      "Logout",
      style: TextStyle(color: Colors.white, fontSize: 16),
    ),
  ),
),

            ],
          ),
        )),
      ),
    );
  }
}

// ==========================
// Reusable Info Row Widget
// ==========================
class InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;

  const InfoRow({
    super.key,
    required this.label,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text(
            "$label: ",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 16,
                color: valueColor ?? Colors.black54,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
