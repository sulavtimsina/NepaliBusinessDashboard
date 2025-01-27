import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nepalibussiness/controllers/service_info_controller.dart';
import 'package:nepalibussiness/model/file_DataModel.dart';
import 'package:nepalibussiness/utils/text_field_component.dart';

import 'package:nepalibussiness/utils/utils.dart';

class Addinginfo extends StatefulWidget {
  const Addinginfo({super.key});

  @override
  State<Addinginfo> createState() => _AddinginfoState();
}

class _AddinginfoState extends State<Addinginfo> {
  File_Data_Model? file;

  @override
  Widget build(BuildContext context) {
    Utils utils = Utils();
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    final ServiceInfoController services_controller =
        Get.put(ServiceInfoController());

    return Scaffold(
      appBar: AppBar(
        title: Text(utils.name),
        backgroundColor: utils.pimaryColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
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
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Add Service Details',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 32),
                        ),
                        SizedBox(
                          height: screenHeight * 0.1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: screenWidth * 0.3,
                                child: TextFieldComponent(
                                    labelText: 'Image Url',
                                    hintText: 'Image Url',
                                    controllerText:
                                        services_controller.imageUrl)),
                            const SizedBox(width: 20),
                            SizedBox(
                                width: screenWidth * 0.3,
                                child: TextFieldComponent(
                                    labelText: 'Name',
                                    hintText: 'Business Name',
                                    controllerText: services_controller.name)),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: screenWidth * 0.3,
                                child: TextFieldComponent(
                                    labelText: 'Category',
                                    hintText: 'Business Category',
                                    controllerText:
                                        services_controller.category)),
                            const SizedBox(width: 20),
                            SizedBox(
                                width: screenWidth * 0.3,
                                child: TextFieldComponent(
                                    labelText: 'Location',
                                    hintText: 'Business Location',
                                    controllerText:
                                        services_controller.location)),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: screenWidth * 0.3,
                                child: TextFieldComponent(
                                    labelText: 'Owner Name',
                                    hintText: 'Owner Name',
                                    controllerText:
                                        services_controller.ownerName)),
                            const SizedBox(width: 20),
                            SizedBox(
                                width: screenWidth * 0.3,
                                child: TextFieldComponent(
                                    labelText: 'Contact Number',
                                    hintText: 'Contact Number',
                                    controllerText:
                                        services_controller.contactNumber)),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: screenWidth * 0.3,
                                child: TextFieldComponent(
                                    labelText: 'Email',
                                    hintText: 'Email',
                                    controllerText:
                                        services_controller.emailAddress)),
                            const SizedBox(width: 20),
                            SizedBox(
                                width: screenWidth * 0.3,
                                child: TextFieldComponent(
                                    labelText: 'Website URL',
                                    hintText: 'Website URL',
                                    controllerText:
                                        services_controller.websiteURL)),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: screenWidth * 0.3,
                                child: TextFieldComponent(
                                    labelText: 'Facebook',
                                    hintText: 'Facebook',
                                    controllerText:
                                        services_controller.facebook)),
                            const SizedBox(width: 20),
                            SizedBox(
                                width: screenWidth * 0.3,
                                child: TextFieldComponent(
                                    labelText: 'Instagram',
                                    hintText: 'Instagram',
                                    controllerText:
                                        services_controller.instagram)),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: screenWidth * 0.3,
                                child: TextFieldComponent(
                                    labelText: 'City',
                                    hintText: 'City',
                                    controllerText: services_controller.city)),
                            const SizedBox(width: 20),
                            SizedBox(
                                width: screenWidth * 0.3,
                                child: TextFieldComponent(
                                    labelText: 'State',
                                    hintText: 'State',
                                    controllerText: services_controller.state)),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: screenWidth * 0.3,
                                child: TextFieldComponent(
                                    labelText: 'Zip Code',
                                    hintText: 'Zip Code',
                                    controllerText:
                                        services_controller.zipCode)),
                            const SizedBox(width: 20),
                            SizedBox(
                                width: screenWidth * 0.3,
                                child: TextFieldComponent(
                                    labelText: 'Country',
                                    hintText: 'Country',
                                    controllerText:
                                        services_controller.country)),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: screenWidth * 0.3,
                                child: TextFieldComponent(
                                    labelText: 'Language Spoken',
                                    hintText: 'Language Spoken',
                                    controllerText:
                                        services_controller.languageSpoken)),
                            const SizedBox(width: 20),
                            SizedBox(
                                width: screenWidth * 0.3,
                                child: TextFieldComponent(
                                    labelText: 'Operating Hours',
                                    hintText: 'Operating Hours',
                                    controllerText:
                                        services_controller.operatingHours)),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: screenWidth * 0.3,
                                child: TextFieldComponent(
                                    labelText: 'Payment Method',
                                    hintText: 'Payment Method',
                                    controllerText:
                                        services_controller.paymentMethod)),
                            const SizedBox(width: 20),
                            SizedBox(
                                width: screenWidth * 0.3,
                                child: TextFieldComponent(
                                    labelText: 'Special Offers',
                                    hintText: 'Special Offers',
                                    controllerText:
                                        services_controller.specialOffers)),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: screenWidth * 0.3,
                                child: TextFieldComponent(
                                    labelText: 'Description',
                                    hintText: 'Description',
                                    controllerText:
                                        services_controller.descrpition)),
                            const SizedBox(width: 20),
                            SizedBox(
                                width: screenWidth * 0.3,
                                child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    controller:
                                        services_controller.verificationStatus,
                                    decoration: InputDecoration(
                                      labelText: 'Verification Status',
                                      labelStyle:
                                          TextStyle(color: utils.textColor),
                                      hintText: 'Verification Status',
                                      hintStyle:
                                          TextStyle(color: utils.textColor),
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.grey),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: utils.textColor),
                                      ),
                                    ))),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'Rating:',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Obx(() => Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: List.generate(5, (index) {
                                    return IconButton(
                                      onPressed: () => services_controller
                                          .updateRating(index + 1),
                                      icon: Icon(
                                        Icons.star,
                                        color: (index <
                                                services_controller
                                                    .selectedRating.value)
                                            ? Colors.amber
                                            : Colors.grey,
                                      ),
                                      iconSize: 40,
                                    );
                                  }),
                                )),
                          ],
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width:
                              screenWidth * 0.3, // Adjust the width as needed
                          height: 45,
                          child: Obx(() {
                            return Stack(
                              alignment: Alignment.center,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(screenWidth * 0.3,
                                        45), // Set minimum width and height
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    backgroundColor:
                                        utils.pimaryColor.withOpacity(
                                      services_controller.isLoading.value
                                          ? 0.5
                                          : 1.0, // Fade effect
                                    ),
                                  ),
                                  onPressed: services_controller
                                              .isSaveButtonEnabled.value &&
                                          !services_controller.isLoading.value
                                      ? () async {
                                          services_controller.isLoading.value =
                                              true;
                                          await services_controller
                                              .saveDataToFirestore();
                                          services_controller.isLoading.value =
                                              false;
                                        }
                                      : null, // Disable the button when loading
                                  child: services_controller.isLoading.value
                                      ? const SizedBox(
                                          width: 24,
                                          height: 24,
                                          child: CircularProgressIndicator(
                                            color:
                                                Color.fromARGB(255, 38, 99, 40),
                                            strokeWidth: 2.5,
                                          ),
                                        )
                                      : const Text(
                                          'Add',
                                          style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 32, 77, 34),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                ),
                              ],
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
