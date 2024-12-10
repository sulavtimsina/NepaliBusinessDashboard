import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nepalibussiness/UI/registration.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDvXxKLp0Wos21MSBXlZM4AOMLhN6TdNL4",
            authDomain: "nepalibusiness-8c8a0.firebaseapp.com",
            projectId: "nepalibusiness-8c8a0",
            storageBucket: "nepalibusiness-8c8a0.firebasestorage.app",
            messagingSenderId: "157850856962",
            appId: "1:157850856962:web:6db1a334f7a742a383c11b"));
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nepali',
      home: Registration(),
    );
  }
}
