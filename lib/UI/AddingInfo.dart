import 'package:flutter/material.dart';
import 'package:nepalibussiness/utils/utils.dart';

class Addinginfo extends StatefulWidget {
  const Addinginfo({super.key});

  @override
  State<Addinginfo> createState() => _AddinginfoState();
}

class _AddinginfoState extends State<Addinginfo> {
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
            height: screenHeight * 0.15,
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
                      fontSize: 30),
                ),
                Text(
                  utils.detail,
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
            child: Center(
              child: Container(
                  height: screenHeight * 0.75,
                  width: screenWidth * 0.85,
                  decoration: BoxDecoration(
                      border: Border.all(color: utils.pimaryColor, width: 3.0),
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
        ],
      ),
    );
  }
}
