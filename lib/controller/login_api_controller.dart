import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pas_mobile_11pplg1_17/API/login_api_api.dart';
import 'package:pas_mobile_11pplg1_17/Routes/routes.dart';
import 'package:pas_mobile_11pplg1_17/models/login_api_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginApiController extends GetxController {
  // Text editing controllers
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Loading state
  var isLoading = false.obs;

  // Data user untuk profile
  var savedUsername = ''.obs;
  var savedEmail = ''.obs;
  var savedFullname = ''.obs;
  var savedPassword = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadSavedData(); // Load data dari SharedPreferences
  }

  // ========================
  //        LOGIN
  // ========================
  void loginApi() async {
    if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar(
        "ERROR",
        "Username dan password tidak boleh kosong",
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
      };

      final response = await http.post(
        Uri.parse(ClientNetwork.login),
        body: requestData,
      );

      if (response.statusCode == 200) {
        final LoginModel loginModel = loginModelFromJson(response.body);

        if (loginModel.status) {
          final prefs = await SharedPreferences.getInstance();

          // Simpan data yang tersedia
          await prefs.setString("username", usernameController.text);
          await prefs.setString("password", passwordController.text);
          await prefs.setString("token", loginModel.token);

          // Load data reactive dari SharedPreferences
          loadSavedData();

          isLoading.value = false;

          Get.snackbar(
            "BERHASIL",
            loginModel.message,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green[100],
            colorText: Colors.black,
          );

          await Future.delayed(const Duration(milliseconds: 1000));
          Get.offAllNamed(AppRoutes.mainmenu);
        } else {
          isLoading.value = false;
          Get.snackbar(
            "ERROR",
            loginModel.message,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red[100],
            colorText: Colors.black,
          );
        }
      } else {
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
      isLoading.value = false;
      Get.snackbar(
        "ERROR",
        "Terjadi kesalahan: $e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red[100],
        colorText: Colors.black,
      );
    }
  }

  // ========================
  //     LOAD DATA PROFILE
  // ========================
  Future<void> loadSavedData() async {
    final prefs = await SharedPreferences.getInstance();
    savedUsername.value = prefs.getString('username') ?? '';
    savedPassword.value = prefs.getString('password') ?? '';
    savedEmail.value = prefs.getString('email') ?? 'Belum ada email';
    savedFullname.value = prefs.getString('fullname') ?? 'Belum ada nama';
  }

  // ========================
  //        LOGOUT
  // ========================
  void logout() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();

      usernameController.clear();
      passwordController.clear();

      savedUsername.value = '';
      savedPassword.value = '';
      savedEmail.value = '';
      savedFullname.value = '';

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
