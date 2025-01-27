import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nepalibussiness/UI/registration.dart';
import 'package:nepalibussiness/controllers/filecontroller.dart';
import 'package:nepalibussiness/res/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBSfoSmGwL_H1hd_xC3ZStkzIhJLonz_d8",
            authDomain: "nepali-business.firebaseapp.com",
            projectId: "nepali-business",
            storageBucket: "nepali-business.firebasestorage.app",
            messagingSenderId: "92485715753", 
            appId: "1:92485715753:web:c96d088ce189f1b627d938"));
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FileController());
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Nepali',
        home: const Registration(),
        getPages: AppRoutes.appRoutes());
  }
}
