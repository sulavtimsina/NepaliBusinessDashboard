import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  RxBool visiblePassword = true.obs;

  RxBool isLoading = false.obs;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signInWithEmailAndPassword() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    @override
    void onInit() {
      emailController.clear();
      passwordController.clear();
      super.onInit();
    }

    // Validate fields
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(
        "Error",
        "Empty fields",
        snackPosition: SnackPosition.TOP,
        backgroundColor: const Color.fromARGB(255, 212, 107, 99),
      );
      return;
    }

    try {
      isLoading.value = true;
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      Get.toNamed('/dashboard');
    } on FirebaseAuthException catch (e) {
      // Handle specific Firebase exceptions
      if (e.code == 'user-not-found') {
        Get.snackbar(
          "Error",
          "Email is incorrect",
          snackPosition: SnackPosition.TOP,
          backgroundColor: const Color.fromARGB(255, 212, 107, 99),
        );
      } else if (e.code == 'wrong-password') {
        Get.snackbar(
          "Error",
          "Password is incorrect",
          snackPosition: SnackPosition.TOP,
          backgroundColor: const Color.fromARGB(255, 212, 107, 99),
        );
      } else {
        Get.snackbar(
          "Error",
          e.message ?? "An unknown error occurred",
          snackPosition: SnackPosition.TOP,
          backgroundColor: const Color.fromARGB(255, 212, 107, 99),
        );
      }
    } finally {
      isLoading.value = false;
    }
  }
}
