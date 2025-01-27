import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nepalibussiness/controllers/businessController.dart';
import 'package:nepalibussiness/utils/utils.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({super.key, required this.documentId});

  final String documentId;

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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: screenWidth * 0.3,
                                child: TextFormField(
                                  controller: controller.ownerName,
                                  decoration: _inputDecoration(
                                      utils, 'Owner Name', 'Owner Name'),
                                ),
                              ),
                              const SizedBox(width: 20),
                              SizedBox(
                                width: screenWidth * 0.3,
                                child: TextFormField(
                                  controller: controller.contactNumber,
                                  decoration: _inputDecoration(
                                      utils, 'Contact', 'Contact Number'),
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
                                  controller: controller.emailAddress,
                                  decoration: _inputDecoration(
                                      utils, 'Email', 'Email Address'),
                                ),
                              ),
                              const SizedBox(width: 20),
                              SizedBox(
                                width: screenWidth * 0.3,
                                child: TextFormField(
                                  controller: controller.websiteURL,
                                  decoration: _inputDecoration(
                                      utils, 'Website URL', 'Website URL'),
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
                                  controller: controller.facebook,
                                  decoration: _inputDecoration(
                                      utils, 'Facebook', 'Facebook'),
                                ),
                              ),
                              const SizedBox(width: 20),
                              SizedBox(
                                width: screenWidth * 0.3,
                                child: TextFormField(
                                  controller: controller.instagram,
                                  decoration: _inputDecoration(
                                      utils, 'Instagram', 'Instagram'),
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
                                  controller: controller.city,
                                  decoration:
                                      _inputDecoration(utils, 'City', 'City'),
                                ),
                              ),
                              const SizedBox(width: 20),
                              SizedBox(
                                width: screenWidth * 0.3,
                                child: TextFormField(
                                  controller: controller.state,
                                  decoration:
                                      _inputDecoration(utils, 'State', 'State'),
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
                                  controller: controller.zipCode,
                                  decoration: _inputDecoration(
                                      utils, 'Zip Code', 'Zip Code'),
                                ),
                              ),
                              const SizedBox(width: 20),
                              SizedBox(
                                width: screenWidth * 0.3,
                                child: TextFormField(
                                  controller: controller.country,
                                  decoration: _inputDecoration(
                                      utils, 'Country', 'Country'),
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
                                  controller: controller.languageSpoken,
                                  decoration: _inputDecoration(
                                      utils,
                                      'Language(s) Spoken',
                                      'Language(s) Spoken'),
                                ),
                              ),
                              const SizedBox(width: 20),
                              SizedBox(
                                width: screenWidth * 0.3,
                                child: TextFormField(
                                  controller: controller.operatingHours,
                                  decoration: _inputDecoration(utils,
                                      'Operating Hours', 'Operating Hours'),
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
                                  controller: controller.paymentMethod,
                                  decoration: _inputDecoration(utils,
                                      'Payment Method', 'Payment Method'),
                                ),
                              ),
                              const SizedBox(width: 20),
                              SizedBox(
                                width: screenWidth * 0.3,
                                child: TextFormField(
                                  controller: controller.specialOffers,
                                  decoration: _inputDecoration(utils,
                                      'Special Offers', 'Special Offers'),
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
                                  controller: controller.verificationStatus,
                                  decoration: _inputDecoration(
                                      utils,
                                      'Verification Status',
                                      'Verification Status'),
                                ),
                              ),
                              const SizedBox(width: 20),
                              SizedBox(
                                width: screenWidth * 0.3,
                                child: TextFormField(
                                  controller: controller.descriptionController,
                                  decoration: _inputDecoration(
                                      utils, 'Description', 'Description'),
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
                            width: screenWidth * 0.3,
                            height: 45,
                            child: Obx(() => ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    backgroundColor: utils.pimaryColor,
                                  ),
                                  onPressed: controller.isLoading.value
                                      ? null
                                      : () async {
                                          controller.isLoading.value = true;
                                          await controller
                                              .updateBusiness(documentId);
                                          controller.isLoading.value = false;
                                        },
                                  child: controller.isLoading.value
                                      ? const SizedBox(
                                          width: 24,
                                          height: 24,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2.0,
                                            color: Color(0xff114c2b),
                                          ),
                                        )
                                      : const Text(
                                          'Save',
                                          style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 32, 77, 34),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                )),
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
