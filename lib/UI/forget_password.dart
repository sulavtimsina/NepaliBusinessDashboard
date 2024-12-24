import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:nepalibussiness/controllers/reset_password_controller.dart';
import 'package:nepalibussiness/utils/utils.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils();
    final ResetPasswordController resetController =
        Get.put(ResetPasswordController());

    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: screenWidth,
            height: screenHeight * 0.35,
            color: utils.pimaryColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  utils.name,
                  style: TextStyle(
                    color: utils.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
                Text(
                  utils.greeting,
                  style: TextStyle(
                    color: utils.textColor,
                    fontWeight: FontWeight.w100,
                    fontSize: 30,
                  ),
                ),
                Text(
                  utils.reset,
                  style: TextStyle(
                    color: utils.textColor,
                    fontWeight: FontWeight.w100,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              width: screenWidth,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: screenWidth * 0.3,
                      child: TextField(
                        controller: resetController.emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(color: utils.textColor),
                          hintText: 'Email',
                          hintStyle: TextStyle(color: utils.textColor),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 11, 49, 13)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Obx(() {
                      return SizedBox(
                        height: 45,
                        width: screenWidth * 0.3,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            backgroundColor: utils.pimaryColor,
                          ),
                          onPressed: resetController.isLoading.value
                              ? null
                              : resetController.sendResetPasswordEmail,
                          child: resetController.isLoading.value
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Text(
                                  'Reset',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 32, 83, 34),
                                      fontWeight: FontWeight.bold),
                                ),
                        ),
                      );
                    }),
                    const SizedBox(height: 14),
                    InkWell(
                      onTap: () {
                        Get.toNamed('/loginScreen');
                      },
                      child: const Text(
                        'Return to Login?',
                        style: TextStyle(
                            color: Color.fromARGB(255, 32, 83, 34),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
