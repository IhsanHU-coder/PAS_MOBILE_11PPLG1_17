import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pas_mobile_11pplg1_17/models/TabelModelPremiereLeague_model.dart';


class PremiereTableController extends GetxController {
  var isLoading = false.obs;
  var standings = <Table>[].obs;

  @override
  void onInit(){
    super.onInit();
    fetchPremiereTable();
  }

   fetchPremiereTable()async{
    const url = "https://www.thesportsdb.com/api/v1/json/3/lookuptable.php?l=4328&s=2025-2026";
    try{
      isLoading.value = true;
      final response = await http.get(Uri.parse(url));
     print("status code" + response.statusCode.toString());
     print("json result" + response.body.toString());
      if(response.statusCode == 200){
        final data = jsonDecode(response.body);
        final List standingData = data["table"];
        standings.assignAll(standingData.map((e) => Table.fromJson(e)).toList());
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