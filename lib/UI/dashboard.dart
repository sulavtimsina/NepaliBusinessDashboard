import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nepalibussiness/UI/editScreen.dart';
import 'package:nepalibussiness/controllers/login_controller.dart';
import 'package:nepalibussiness/controllers/service_info_controller.dart';

import 'package:nepalibussiness/utils/utils.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    Utils utils = Utils();

    final ServiceInfoController services_controller =
        Get.put(ServiceInfoController());
    final LoginController login_controller = Get.put(LoginController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: utils.pimaryColor,
        centerTitle: true,
        automaticallyImplyLeading: false, // Removes the back button from AppBar

        actions: [
          Padding(
            padding: const EdgeInsets.all(5.0),
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
      body: Column(
        children: [
          Obx(() {
            if (services_controller.businessData.isEmpty) {
              return const Center(child: Text("No business data available."));
            }
            return Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(28.0),
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          business['ImageUrl'] != null &&
                                  business['ImageUrl'].isNotEmpty
                              ? CachedNetworkImage(
                                  imageUrl: business['ImageUrl'],
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator(
                                      color: Color(0xff114c2b),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(
                                    Icons.broken_image,
                                    size: 80,
                                  ),
                                )
                              : const Icon(Icons.image_not_supported, size: 80),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  business['Name'] ?? 'Unknown Name',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "Category: ${business['Category'] ?? 'N/A'}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                // Text(
                                //   "Location: ${business['Location'] ?? 'N/A'}",
                                //   style: const TextStyle(
                                //       fontWeight: FontWeight.bold,
                                //       fontSize: 14),
                                // ),
                                // Text(
                                //   "Rating: ${business['Rating'] ?? 'N/A'}",
                                //   style: const TextStyle(
                                //       fontWeight: FontWeight.bold,
                                //       fontSize: 14),
                                // ),
                                // Text(
                                //   "Description: ${business['Description'] ?? 'N/A'}",
                                //   style: const TextStyle(
                                //       fontWeight: FontWeight.bold,
                                //       fontSize: 10),
                                // ),
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
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () {
                                  Get.to(() => EditScreen(
                                        documentId: documentId,
                                      ));
                                },
                              ),
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
