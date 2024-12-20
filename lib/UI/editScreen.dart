import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nepalibussiness/controllers/businessController.dart';
import 'package:nepalibussiness/utils/DropZoneWidget.dart';
import 'package:nepalibussiness/utils/DroppedFileWidget.dart';
import 'package:nepalibussiness/utils/utils.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({super.key, required this.documentId});

  final String documentId; // Pass the documentId to the widget

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils();
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    final BusinessController controller = Get.put(BusinessController());

    return Scaffold(
      body: FutureBuilder<void>(
        future: controller.fetchBusinessById(documentId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                // Header
                Container(
                  height: screenHeight * 0.2,
                  color: utils.pimaryColor, // Corrected typo from pimaryColor
                  alignment: Alignment.center,
                  child: Text(
                    utils.name,
                    style: TextStyle(
                      color: utils.textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      border: Border.all(color: utils.textColor, width: 1.0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: DroppedFileWidget(),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: DropZoneWidget(),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: screenWidth * 0.3,
                              child: TextFormField(
                                controller: controller.nameController,
                                decoration: _inputDecoration(
                                    utils, 'Name', 'Business Name'),
                              ),
                            ),
                            const SizedBox(width: 20),
                            SizedBox(
                              width: screenWidth * 0.3,
                              child: TextFormField(
                                controller: controller.categoryController,
                                decoration: _inputDecoration(
                                    utils, 'Category', 'Business Category'),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: screenWidth * 0.3,
                              child: TextFormField(
                                controller: controller.locationController,
                                decoration: _inputDecoration(
                                    utils, 'Location', 'Business Location'),
                              ),
                            ),
                            const SizedBox(width: 20),
                            SizedBox(
                              width: screenWidth * 0.3,
                              child: TextFormField(
                                controller: controller.descriptionController,
                                decoration: _inputDecoration(utils,
                                    'Description', 'Business Description'),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Rating:',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 20),
                            Obx(() {
                              return Row(
                                children: List.generate(5, (index) {
                                  return IconButton(
                                    onPressed: () => controller
                                        .selectedRating.value = index + 1,
                                    icon: Icon(
                                      Icons.star,
                                      color: index <
                                              controller.selectedRating.value
                                          ? Colors.amber
                                          : Colors.grey,
                                    ),
                                  );
                                }),
                              );
                            }),
                          ],
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: screenWidth * 0.25,
                          height: 45,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: utils.pimaryColor,
                            ),
                            onPressed: () =>
                                controller.updateBusiness(documentId),
                            child: const Text(
                              'Save Changes',
                              style: TextStyle(
                                color: Color.fromARGB(255, 32, 77, 34),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  InputDecoration _inputDecoration(
      Utils utils, String labelText, String hintText) {
    return InputDecoration(
      labelText: labelText,
      labelStyle: TextStyle(color: utils.textColor),
      hintText: hintText,
      hintStyle: TextStyle(color: utils.textColor),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Color.fromARGB(255, 11, 49, 13)),
      ),
    );
  }
}
