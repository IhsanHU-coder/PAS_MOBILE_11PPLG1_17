import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_17/controller/btn_nav_controller.dart';
import 'package:pas_mobile_11pplg1_17/controller/contact_controller.dart';
import 'package:pas_mobile_11pplg1_17/controller/data_product_controller.dart';
import 'package:pas_mobile_11pplg1_17/controller/dog_data_controller.dart';
import 'package:pas_mobile_11pplg1_17/controller/landscape_controller.dart';
import 'package:pas_mobile_11pplg1_17/controller/login_api_controller.dart';
import 'package:pas_mobile_11pplg1_17/controller/premiere_table_controller.dart';
import 'package:pas_mobile_11pplg1_17/controller/register_api_controller.dart';
import 'package:pas_mobile_11pplg1_17/controller/splashscreen_controller.dart';


class AllBindings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<PremiereTableController>(()=>PremiereTableController());
    Get.lazyPut<DogDataController>(()=>DogDataController());
    Get.lazyPut<BtnNavController>(()=>BtnNavController());
    Get.lazyPut<ContactController>(()=>ContactController());
    Get.lazyPut<SplashscreenController>(()=>SplashscreenController());
    Get.lazyPut<LoginApiController>(()=>LoginApiController());
    Get.lazyPut<LandscapeController>(()=>LandscapeController());
    Get.lazyPut<DataProductController>(()=>DataProductController());
    Get.lazyPut<RegisterApiController>(()=>RegisterApiController());
  }
}