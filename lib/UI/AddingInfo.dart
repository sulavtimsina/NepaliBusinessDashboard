import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nepalibussiness/controllers/service_info_controller.dart';
import 'package:nepalibussiness/model/file_DataModel.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            Container(
              height: screenHeight * 0.2,
              color: utils.pimaryColor,
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
                width: screenWidth * 0.8,
                height: screenHeight * 0.6,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(color: utils.textColor, width: 1.0),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                              width: screenWidth * 0.3,
                              child: TextFormField(
                                  controller: services_controller.imageUrl,
                                  decoration: InputDecoration(
                                    labelText: 'Image URL',
                                    labelStyle:
                                        TextStyle(color: utils.textColor),
                                    hintText: 'URL',
                                    hintStyle:
                                        TextStyle(color: utils.textColor),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          const BorderSide(color: Colors.grey),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                          color:
                                              Color.fromARGB(255, 11, 49, 13)),
                                    ),
                                  ))),
                          const SizedBox(width: 20),
                          SizedBox(
                              width: screenWidth * 0.3,
                              child: TextFormField(
                                  controller: services_controller.name,
                                  decoration: InputDecoration(
                                    labelText: 'Name',
                                    labelStyle:
                                        TextStyle(color: utils.textColor),
                                    hintText: 'Business Name',
                                    hintStyle:
                                        TextStyle(color: utils.textColor),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          const BorderSide(color: Colors.grey),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                          color:
                                              Color.fromARGB(255, 11, 49, 13)),
                                    ),
                                  ))),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: screenWidth * 0.3,
                            child: TextFormField(
                              controller: services_controller.category,
                              decoration: InputDecoration(
                                labelText: 'Category',
                                labelStyle: TextStyle(color: utils.textColor),
                                hintText: 'Busniess Category',
                                hintStyle: TextStyle(color: utils.textColor),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 11, 49, 13)),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          SizedBox(
                            width: screenWidth * 0.3,
                            child: TextFormField(
                              controller: services_controller.location,
                              decoration: InputDecoration(
                                labelText: 'Location',
                                labelStyle: TextStyle(color: utils.textColor),
                                hintText: 'Business Location',
                                hintStyle: TextStyle(color: utils.textColor),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 11, 49, 13)),
                                ),
                              ),
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
                              controller: services_controller.descrpition,
                              decoration: InputDecoration(
                                labelText: 'Description',
                                labelStyle: TextStyle(color: utils.textColor),
                                hintText: 'Business Descrpition',
                                hintStyle: TextStyle(color: utils.textColor),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical:
                                      10.0, // Keep this low to align text at the top
                                  horizontal: 10.0,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 11, 49, 13)),
                                ),
                              ),
                              maxLines:
                                  null, // Allows the TextField to grow vertically if needed
                              textAlignVertical: TextAlignVertical
                                  .top, // Aligns text at the top
                            ),
                          ),
                          const SizedBox(width: 20),
                        ],
                      ),
                      const SizedBox(height: 20),
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
                          width: screenWidth * 0.25,
                          height: 45,
                          child: Obx(() {
                            return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: utils.pimaryColor,
                              ),
                              onPressed:
                                  services_controller.isSaveButtonEnabled.value
                                      ? services_controller.saveDataToFirestore
                                      : null,
                              child: const Text(
                                'Add',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 32, 77, 34),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          })),
                    ],
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
