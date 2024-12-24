import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nepalibussiness/controllers/businessController.dart';
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
      appBar: AppBar(
        title: Text(utils.name),
        backgroundColor: utils.pimaryColor,
        centerTitle: true,
      ),
      body: FutureBuilder<void>(
        future: controller.fetchBusinessById(documentId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Container(
                      width: screenWidth * 0.8,
                      height: screenHeight * 0.8,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(color: utils.textColor, width: 1.0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Edit Service Details',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 32),
                          ),
                          SizedBox(
                            height: screenHeight * 0.1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: screenWidth * 0.3,
                                child: TextFormField(
                                  controller: controller.imageController,
                                  decoration: _inputDecoration(
                                      utils, 'ImageUrl', 'Image Url'),
                                ),
                              ),
                              const SizedBox(width: 20),
                              SizedBox(
                                width: screenWidth * 0.3,
                                child: TextFormField(
                                  controller: controller.nameController,
                                  decoration: _inputDecoration(
                                      utils, 'Name', 'Business Name'),
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
                                  controller: controller.categoryController,
                                  decoration: _inputDecoration(
                                      utils, 'Category', 'Business Category'),
                                ),
                              ),
                              const SizedBox(width: 20),
                              SizedBox(
                                width: screenWidth * 0.3,
                                child: TextFormField(
                                  controller: controller.locationController,
                                  decoration: _inputDecoration(
                                      utils, 'Location', 'Business Location'),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: screenWidth * 0.5,
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
                                'Save',
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
