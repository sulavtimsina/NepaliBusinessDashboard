import 'package:flutter/material.dart';
import 'package:nepalibussiness/UI/AddingInfo.dart';
import 'package:nepalibussiness/utils/utils.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

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
                  utils.greeting1,
                  style: TextStyle(
                    color: utils.textColor,
                    fontWeight: FontWeight.w100,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: screenWidth * 0.3,
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 20.0, bottom: 20.0),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Addinginfo()));
          },
          tooltip: "Add",
          backgroundColor: utils.pimaryColor,
          foregroundColor: utils.textColor,
          child: const Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
