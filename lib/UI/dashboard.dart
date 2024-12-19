import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nepalibussiness/controllers/login_controller.dart';
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
    final LoginController login_controller = Get.put(LoginController());

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
                      login_controller.signOut();
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
          Obx(() {
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
                  final documentId = business['id'];

                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
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
                              Text(
                                  "Category: ${business['Category'] ?? 'N/A'}"),
                              Text(
                                  "Location: ${business['Location'] ?? 'N/A'}"),
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
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(Icons.edit),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  // Confirm before deletion
                                  Get.defaultDialog(
                                    title: 'Delete Confirmation',
                                    titleStyle: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: utils.textColor,
                                    ),
                                    middleText:
                                        'Are you sure you want to delete this business?',
                                    middleTextStyle: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey[700],
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 20.0, horizontal: 30.0),
                                    radius: 10.0,
                                    backgroundColor: Colors.white,
                                    content: Column(
                                      children: [
                                        const Icon(
                                          Icons.warning_amber_rounded,
                                          color: Colors.red,
                                          size: 50,
                                        ),
                                        const SizedBox(height: 15),
                                        Text(
                                          'This action is irreversible.',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontStyle: FontStyle.italic,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                      ],
                                    ),
                                    confirm: ElevatedButton.icon(
                                      onPressed: () {
                                        services_controller
                                            .deleteBusiness(documentId);
                                        Get.back();
                                      },
                                      icon: const Icon(Icons.delete,
                                          color: Colors.white),
                                      label: const Text(
                                        'Delete',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromARGB(
                                            255, 38, 109, 40),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        textStyle: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    cancel: OutlinedButton.icon(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      icon: Icon(Icons.cancel,
                                          color: utils.textColor),
                                      label: Text(
                                        'Cancel',
                                        style:
                                            TextStyle(color: utils.textColor),
                                      ),
                                      style: OutlinedButton.styleFrom(
                                        side: BorderSide(
                                            color: utils.pimaryColor, width: 2),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        textStyle: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    barrierDismissible: false,
                                  );
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }),
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
