import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ResetPasswordController extends GetxController {
  final TextEditingController emailController = TextEditingController();

  RxBool isLoading = false.obs;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> sendResetPasswordEmail() async {
    final email = emailController.text.trim();
    if (email.isEmpty) {
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

      await _firebaseAuth.sendPasswordResetEmail(email: email);
      Get.snackbar(
        "Success",
        "Email is Sent",
        snackPosition: SnackPosition.TOP,
        backgroundColor: const Color.fromARGB(255, 99, 189, 102),
      );
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Error",
        e.message ?? "An unknown error occurred",
        snackPosition: SnackPosition.TOP,
        backgroundColor: const Color.fromARGB(255, 212, 107, 99),
      );
    } finally {
      isLoading.value = false;
    }
  }
}
