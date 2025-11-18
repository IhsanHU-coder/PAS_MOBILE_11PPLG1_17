import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_17/controller/landscape_controller.dart';
import 'package:pas_mobile_11pplg1_17/pages/Landscape/dog_data_landscape_page.dart';
import 'package:pas_mobile_11pplg1_17/pages/Potrait/dog_data_potrait_page.dart';

class DogDataPage extends StatelessWidget {
  DogDataPage({super.key});

  final LandscapeController controller = Get.find<LandscapeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constrains){
          controller.updateLayout(constrains);
        return Obx(()=> controller.isMobile.value
         ? DogDataPotraitPage()
         : DogDataLandscapePage());
      }),
    );
  }
}