import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pas_mobile_11pplg1_17/models/DataProduct.dart';

class DataProductController extends GetxController {
  var isLoading = false.obs;
  var dataProducts = <DataProduct>[].obs;

  @override
  void onInit(){
    super.onInit();
    fetchDataProduct();
  }

  Future<void> fetchDataProduct() async {
    const url = "https://fakestoreapi.com/products";
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final dataProduct = dataProductFromJson(response.body);
        dataProducts.assignAll(dataProduct);
      } else {
        Get.snackbar("Failed", "Something error: ${response.statusCode}");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
