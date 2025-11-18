import 'dart:convert';
import 'package:flutter/material.dart';
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

   Future<void> fetchDataProduct()async{
    const url = "https://fakestoreapi.com/products";
    try{
      isLoading.value = true;

      final response = await http.get(Uri.parse(url));
     print("status code" + response.statusCode.toString());
     print("json result" + response.body.toString());
      if(response.statusCode == 200){
        final dataProduct = dataProductFromJson(response.body);
        dataProducts.assignAll(dataProduct);
        //Mengisi variable standings dari data model standingdata (json)
      }else{
        Get.snackbar("Failed", "something error");
      }
    } catch (e){
        Get.snackbar("error", e.toString());
    }
    isLoading.value = false;
  }
}