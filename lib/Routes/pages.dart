import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_17/Routes/routes.dart';
import 'package:pas_mobile_11pplg1_17/bindings/all_bindings.dart';
import 'package:pas_mobile_11pplg1_17/pages/Potrait/profile_page.dart';
import 'package:pas_mobile_11pplg1_17/pages/btn_nav_page.dart';
import 'package:pas_mobile_11pplg1_17/pages/contact_page.dart';
import 'package:pas_mobile_11pplg1_17/pages/data_product_page.dart';
import 'package:pas_mobile_11pplg1_17/pages/dog_data_page.dart';
import 'package:pas_mobile_11pplg1_17/pages/login_api_page.dart';
import 'package:pas_mobile_11pplg1_17/pages/premiere_table_page.dart';
import 'package:pas_mobile_11pplg1_17/pages/register_api_page.dart';
import 'package:pas_mobile_11pplg1_17/pages/splashscreen_page.dart';


class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.premiereTable,
      page: () => PremiereTablePage(),
      binding: AllBindings(),
    ),
    GetPage(
      name: AppRoutes.dogData,
      page: () => DogDataPage(),
      binding: AllBindings(),
    ),
    GetPage(
      name: AppRoutes.mainmenu,
      page: () => BtnNavPage(),
      binding: AllBindings(),
    ),
    GetPage(
      name: AppRoutes.contactPage,
      page: () => ContactPage(),
      binding: AllBindings(),
    ),
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => SplashscreenPage(),
      binding: AllBindings(),
    ),
    GetPage(
      name: AppRoutes.loginApi,
      page: () => LoginApiPage(),
      binding: AllBindings(),
    ),
    GetPage(
      name: AppRoutes.dataProduct,
      page: () => DataProductPage(),
      binding: AllBindings(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => ProfilePage(),
      binding: AllBindings(),
    ),
    GetPage(
      name: AppRoutes.registerApi,
      page: () => RegisterApiPage(),
      binding: AllBindings(),
    ),
  ];
}
