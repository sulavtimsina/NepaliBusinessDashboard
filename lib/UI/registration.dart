import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nepalibussiness/controllers/login_controller.dart';
import 'package:nepalibussiness/utils/utils.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils();
    final LoginController loginController = Get.put(LoginController());

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
                  utils.pageName,
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
                        controller: loginController.emailController,
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
                    const SizedBox(height: 16),
                    SizedBox(
                      width: screenWidth * 0.3,
                      child: Obx(
                        () => TextField(
                          controller: loginController.passwordController,
                          keyboardType: TextInputType.text,
                          obscureText: loginController
                              .visiblePassword.value, // Bind visibility
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(color: utils.textColor),
                            hintText: 'Password',
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
                            suffixIcon: IconButton(
                              icon: Icon(
                                loginController.visiblePassword.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: loginController.visiblePassword.value
                                    ? Colors.grey.shade500
                                    : utils.textColor,
                              ),
                              onPressed: () {
                                loginController.visiblePassword.value =
                                    !loginController.visiblePassword
                                        .value; // Toggle visibility
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    InkWell(
                      onTap: () {
                        Get.toNamed('/reset');
                      },
                      child: Text(
                        'Forget Password?',
                        style: TextStyle(color: Colors.green[900]),
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
                          onPressed: loginController.isLoading.value
                              ? null
                              : loginController.signInWithEmailAndPassword,
                          child: loginController.isLoading.value
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Text('Login'),
                        ),
                      );
                    }),
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
