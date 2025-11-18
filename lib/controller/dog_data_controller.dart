import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pas_mobile_11pplg1_17/models/DogData.dart';

class DogDataController extends GetxController {
  var isLoading = false.obs;

  /// List untuk menampung dog breed
  var dogs = <Datum>[].obs;
  var isMobile = true.obs;

  void updateLayout(BoxConstraints constraints){
    isMobile.value = constraints.maxWidth < 600;//640
    
  }

  @override
  void onInit() {
    super.onInit();
    fetchDogData();
  }

  Future<void> fetchDogData() async {
    const url = "https://dogapi.dog/api/v2/breeds";

    try {
      isLoading.value = true;

      final response = await http.get(Uri.parse(url));
      print("Status code: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200) {
        /// PARSING KE MODEL DogData
        final dogData = dogDataFromJson(response.body);

        /// masukkan list `data` ke observable dogs
        dogs.assignAll(dogData.data);
      } else {
        Get.snackbar("Failed", "Something error");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }

    isLoading.value = false;
  }
}
