import 'package:ecommerceapp/core/lcalization/changelocale.dart';
import 'package:ecommerceapp/core/lcalization/translation.dart';
import 'package:ecommerceapp/core/services/services.dart';
import 'package:ecommerceapp/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
//import 'package:ecommerceapp/firebase_options.dart';
//import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Get.putAsync<MyServices>(() async {
    return await MyServices().initWithoutFirebase();
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController localeController = Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTranslation(),
      locale: localeController.language,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: localeController.apptheme,
      //home: const Language(),
      getPages: routes,
    );
  }
}
