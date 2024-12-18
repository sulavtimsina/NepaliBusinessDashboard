import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nepalibussiness/controllers/service_info_controller.dart';

import 'package:nepalibussiness/utils/utils.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    Utils utils = Utils();
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    final ServiceInfoController services_controller =
        Get.put(ServiceInfoController());

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: screenWidth,
            height: screenHeight * 0.15,
            color: utils.pimaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        utils.name.toString(),
                        style: TextStyle(
                          color: utils.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
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
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: IconButton(
                    onPressed: () {
                      Get.offAllNamed('/loginScreen');
                    },
                    icon: Icon(
                      Icons.logout,
                      color: utils.textColor,
                      size: 28,
                    ),
                    tooltip: "Logout",
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Obx(() {
              if (services_controller.businessData.isEmpty) {
                return const Center(child: Text("No business data available."));
              }

              return Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.all(8.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    childAspectRatio: 3.2,
                  ),
                  itemCount: services_controller.businessData.length,
                  itemBuilder: (context, index) {
                    final business = services_controller.businessData[index];

                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              business['Name'] ?? 'Unknown Name',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 4),
                            Text("Category: ${business['Category'] ?? 'N/A'}"),
                            Text("Location: ${business['Location'] ?? 'N/A'}"),
                            Text("Rating: ${business['Rating'] ?? 'N/A'}"),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(5, (i) {
                                if (i < business['Rating']) {
                                  return const Icon(Icons.star,
                                      color: Colors.yellow, size: 20);
                                } else {
                                  return const Icon(Icons.star_border,
                                      color: Colors.grey, size: 20);
                                }
                              }),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 20.0, bottom: 20.0),
        child: FloatingActionButton(
          onPressed: () {
            Get.toNamed('/addingDetail');
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
