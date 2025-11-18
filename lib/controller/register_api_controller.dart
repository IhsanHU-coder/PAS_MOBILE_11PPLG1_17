import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pas_mobile_11pplg1_17/API/login_api_api.dart';
import 'package:pas_mobile_11pplg1_17/Routes/routes.dart';
import 'package:pas_mobile_11pplg1_17/models/register_api_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterApiController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();

  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void registerApi() async {
    if (usernameController.text.isEmpty || passwordController.text.isEmpty || fullName.text.isEmpty || email.text.isEmpty) {

      Get.snackbar(
        "ERROR",
        "tidak boleh ada yang kosong",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color.fromARGB(63, 112, 111, 111),
        colorText: Colors.black,
      );

      return;
    }

    isLoading.value = true;

    try {
      final requestData = {
        'username': usernameController.text,
        'password': passwordController.text,
        'fullUser': fullName.text,
        'email': email.text,
      };

      final response = await http.get(
        Uri.parse(ClientNetwork.login),
        headers: requestData,
      );

      if (response.statusCode == 200) {

        try {
          final RegisterModel registerModel = registerModelFromJson(response.body);

          if (registerModel.status) {
            print('✅ Login Status: SUCCESS');

            final prefs = await SharedPreferences.getInstance();
            // await prefs.setString("username", usernameController.text);
            await prefs.setString("username",usernameController.text);
            await prefs.setString("fullUser", fullName.text);
            await prefs.setString("email", email.text);
            // await prefs.setString('token', registerModel.token);

            print('💾 Token & Username saved');

            isLoading.value = false;
            

            Get.snackbar(
              "BERHASIL",
              registerModel.message,
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green[100],
              colorText: Colors.black,
            );

            

            await Future.delayed(const Duration(milliseconds: 5000));

            Get.offAllNamed(AppRoutes.mainmenu);
          } else {
            print('❌ Login Status: FAILED');

            isLoading.value = false;

            

            Get.snackbar(
              "ERROR",
              registerModel.message,
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red[100],
              colorText: Colors.black,
            );

            print('========================================');
            print('❌ LOGIN FAILED');
            print('========================================\n');
          }
        } catch (e) {
          isLoading.value = false;

          print('\n❌ JSON PARSE ERROR: $e');
          print('Raw Response: ${response.body}');

          Get.snackbar(
            "ERROR",
            "Error parsing response: $e",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red[100],
            colorText: Colors.black,
          );
        }
      } else {
        // ===============================
        //      SERVER ERROR ≠ 200
        // ===============================
        print('❌ Status Code: ${response.statusCode}');
        isLoading.value = false;

        Get.snackbar(
          "ERROR",
          "Server error: ${response.statusCode}",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red[100],
          colorText: Colors.black,
        );
      }
    } catch (e) {
      // ===============================
      //          EXCEPTION
      // ===============================
      isLoading.value = false;

      print('\n❌❌ EXCEPTION: $e');

      Get.snackbar(
        "ERROR",
        "Terjadi kesalahan: $e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red[100],
        colorText: Colors.black,
      );
    }
  }

  // ==============================
  //            LOGOUT
  // ==============================
  void logout() async {
    print('\n========================================');
    print('🚪 LOGOUT STARTED');
    print('========================================');

    try {
      final prefs = await SharedPreferences.getInstance();

      await prefs.remove("username");
      await prefs.remove("fullUser");
      await prefs.remove("email");
      // await prefs.remove("token");

      usernameController.clear();
      passwordController.clear();
      fullName.clear();
      email.clear();

      print('🧹 SharedPreferences cleared');

      

      Get.snackbar(
        "LOGOUT",
        "Logout akun berhasil",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.orange[100],
        colorText: Colors.black,
      );

       await Future.delayed(const Duration(milliseconds: 5000));

      Get.offAllNamed(AppRoutes.loginApi);
      

      print('========================================');
      print('✅ LOGOUT COMPLETED');
      print('========================================\n');
    } catch (e) {
      print('❌ Logout Error: $e');

      Get.snackbar(
        "ERROR",
        "Gagal logout API: $e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red[100],
        colorText: Colors.black,
      );
    }
  }
}
