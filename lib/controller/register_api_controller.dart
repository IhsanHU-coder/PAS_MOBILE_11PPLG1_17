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

  void registerApi() async {
    if (usernameController.text.isEmpty ||
        passwordController.text.isEmpty ||
        fullName.text.isEmpty ||
        email.text.isEmpty) {
      Get.snackbar("ERROR", "Tidak boleh ada yang kosong");
      return;
    }

    isLoading.value = true;

    try {
      final requestData = {
        'username': usernameController.text,
        'password': passwordController.text,
        'full_name': fullName.text,
        'email': email.text,
      };

      final response = await http.post(
        Uri.parse(ClientNetwork.register),
        body: requestData,
      );

      if (response.statusCode == 200) {
        final RegisterModel data = registerModelFromJson(response.body);

        if (data.status) {
          // Simpan semua data ke SharedPreferences
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString("username", usernameController.text);
          await prefs.setString("password", passwordController.text);
          await prefs.setString("email", email.text);
          await prefs.setString("fullname", fullName.text);

          Get.snackbar(
            "BERHASIL",
            data.message,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green[100],
            colorText: Colors.black,
          );

          await Future.delayed(const Duration(milliseconds: 1000));
          Get.offAllNamed(AppRoutes.loginApi);
        } else {
          Get.snackbar("ERROR", data.message);
        }
      } else {
        Get.snackbar("ERROR", "Status code: ${response.statusCode}");
      }
    } catch (e) {
      Get.snackbar("ERROR", "Exception: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void logout() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();

      usernameController.clear();
      passwordController.clear();
      fullName.clear();
      email.clear();

      Get.snackbar(
        "LOGOUT",
        "Logout akun berhasil",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.orange[100],
        colorText: Colors.black,
      );

      await Future.delayed(const Duration(milliseconds: 1000));
      Get.offAllNamed(AppRoutes.loginApi);
    } catch (e) {
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
