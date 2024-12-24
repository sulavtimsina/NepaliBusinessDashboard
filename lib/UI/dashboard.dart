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
    final ServiceInfoController servicesController =
        Get.put(ServiceInfoController());
    final LoginController loginController = Get.put(LoginController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: utils.pimaryColor,
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              loginController.signOut();
            },
            icon: Icon(Icons.logout, color: utils.textColor, size: 28),
            tooltip: "Logout",
          ),
        ],
      ),
      body: Obx(() {
        if (servicesController.businessData.isEmpty) {
          return const Center(
            child: Text(
              "No business data available.",
              style: TextStyle(fontSize: 18),
            ),
          );
        }

        return LayoutBuilder(
          builder: (context, constraints) {
            // Dynamically determine the grid layout
            int crossAxisCount = constraints.maxWidth > 1000
                ? 4
                : constraints.maxWidth > 800
                    ? 3
                    : constraints.maxWidth > 600
                        ? 2
                        : 1;

            double cardWidth = constraints.maxWidth / crossAxisCount - 16;

            return GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: cardWidth / 150, // Maintain card aspect ratio
              ),
              itemCount: servicesController.businessData.length,
              itemBuilder: (context, index) {
                final business = servicesController.businessData[index];
                final documentId = business['id'];

                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CachedNetworkImage(
                          imageUrl: business['ImageUrl'] ?? '',
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(
                              color: Color(0xff114c2b),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.broken_image, size: 80),
                        ),
                        const SizedBox(width: 10),
                        // Business Info and Actions
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // Business Info
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    business['Name'] ?? 'Unknown Name',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "Category: ${business['Category'] ?? 'N/A'}",
                                    style: const TextStyle(
                                      fontSize: 12,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: List.generate(5, (starIndex) {
                                      return Icon(
                                        starIndex < (business['Rating'] ?? 0)
                                            ? Icons.star
                                            : Icons.star_border,
                                        color: starIndex <
                                                (business['Rating'] ?? 0)
                                            ? Colors.yellow
                                            : Colors.grey,
                                        size: 16,
                                      );
                                    }),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              // Action Buttons
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit, size: 20),
                                    onPressed: () {
                                      Get.to(() =>
                                          EditScreen(documentId: documentId));
                                    },
                                    tooltip: 'Edit',
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete, size: 20),
                                    onPressed: () {
                                      Get.defaultDialog(
                                        titlePadding: const EdgeInsets.all(20),
                                        contentPadding:
                                            const EdgeInsets.all(20),
                                        title: 'Delete Confirmation',
                                        content: const Text(
                                            'Are you sure you want to delete this business?'),
                                        confirm: ElevatedButton(
                                          onPressed: () {
                                            servicesController
                                                .deleteBusiness(documentId);
                                            Get.back();
                                          },
                                          child: const Text(
                                            'Delete',
                                            style: TextStyle(
                                                color: Color(0xff114c2b)),
                                          ),
                                        ),
                                        cancel: ElevatedButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: const Text(
                                            'Cancel',
                                            style: TextStyle(
                                                color: Color(0xff114c2b)),
                                          ),
                                        ),
                                      );
                                    },
                                    tooltip: 'Delete',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/addingDetail');
        },
        tooltip: "Add",
        backgroundColor: utils.pimaryColor,
        foregroundColor: utils.textColor,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
