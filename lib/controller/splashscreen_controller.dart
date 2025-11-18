import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_17/Routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashscreenController extends GetxController{
  @override
  void onInit() {
    super.onInit();
    //cek if username is stored
    checkLogin();
  }

  // void checkLogin()async{
  //   await Future.delayed(Duration(seconds: 1));
  //   final prefs = await SharedPreferences.getInstance();
  //   final savedUsername = prefs.getString("username");
  //   if(savedUsername != null){
  //     Get.offAllNamed(AppRoutes.btnNav);
  //   }else{
  //     Get.offAllNamed(AppRoutes.loginapi);
  //   }
  // }

  void checkLogin() async {
  await Future.delayed(Duration(seconds: 1));
  final prefs = await SharedPreferences.getInstance();
  final savedUsername = prefs.getString("username");

  print("✅ Splashscreen checkLogin called, username = $savedUsername");

  if (savedUsername != null) {
    print("➡️ Redirect to main menu");
    Get.offAllNamed(AppRoutes.mainmenu);
  } else {
    print("➡️ Redirect to login page");
    Get.offAllNamed(AppRoutes.loginApi);
  }
}


  
}