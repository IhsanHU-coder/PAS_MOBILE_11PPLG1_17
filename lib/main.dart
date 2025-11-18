import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_17/Routes/pages.dart';
import 'package:pas_mobile_11pplg1_17/Routes/routes.dart';
import 'package:pas_mobile_11pplg1_17/bindings/all_bindings.dart';
import 'package:pas_mobile_11pplg1_17/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Jangan panggil DBHelper di sini — DBHelper diinisialisasi saat dipakai
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PAS Product App',
      theme: myTheme,
      initialRoute: AppRoutes.splashScreen,
      getPages: AppPages.pages,
      initialBinding: AllBindings(),
    );
  }
}
