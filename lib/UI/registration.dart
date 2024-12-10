import 'package:flutter/material.dart';
import 'package:nepalibussiness/utils/utils.dart';

class Registration extends StatelessWidget {
  const Registration({super.key});

  @override
  Widget build(BuildContext context) {
    Utils utils = new Utils();
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: screenWidth * 1.0,
            height: screenHeight * 0.35,
            color: utils.pimaryColor,
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Center align the text
              mainAxisAlignment: MainAxisAlignment.center, // Center vertically
              children: [
                Text(
                  utils.name.toString(),
                  style: TextStyle(
                      color: utils.textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
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
                )
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
                    Container(
                        width: screenWidth * 0.3,
                        child: TextField(
                            decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(color: utils.textColor),
                          // Label style
                          hintText: 'Email',
                          hintStyle: TextStyle(color: utils.textColor),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 255, 255, 255),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 11, 49, 13)),
                          ),
                        ))),
                    const SizedBox(height: 16),
                    Container(
                        width: screenWidth * 0.3,
                        child: TextField(
                            decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(color: utils.textColor),
                          // Label style
                          hintText: 'Password',
                          hintStyle: TextStyle(color: utils.textColor),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 255, 255, 255),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 11, 49, 13)),
                          ),
                        ))),
                    const SizedBox(height: 14),
                    InkWell(
                      child: Text(
                        'Forget Password?',
                        style: TextStyle(color: Colors.green[900]),
                      ),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: screenWidth * 0.3,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            backgroundColor: utils.pimaryColor),
                        onPressed: () {},
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.green[900],
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
