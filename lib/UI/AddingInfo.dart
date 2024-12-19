import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nepalibussiness/controllers/service_info_controller.dart';
import 'package:nepalibussiness/model/file_DataModel.dart';
import 'package:nepalibussiness/utils/DropZoneWidget.dart';
import 'package:nepalibussiness/utils/DroppedFileWidget.dart';
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
              width: double.infinity,
              height: 120,
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: screenWidth * 0.3,
                          child: TextFormField(
                            controller: services_controller.name,
                            decoration:
                                const InputDecoration(labelText: 'Name'),
                          ),
                        ),
                        const SizedBox(width: 20),
                        SizedBox(
                          width: screenWidth * 0.3,
                          child: TextFormField(
                            controller: services_controller.category,
                            decoration:
                                const InputDecoration(labelText: 'Category'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: screenWidth * 0.3,
                          child: TextFormField(
                            controller: services_controller.location,
                            decoration:
                                const InputDecoration(labelText: 'Location'),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Container(
                          width: screenWidth * 0.3,
                          child: TextFormField(
                            controller: services_controller.descrpition,
                            decoration:
                                const InputDecoration(labelText: 'Description'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: const Text(
                            'Rating:',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Obx(() => Row(
                              mainAxisAlignment: MainAxisAlignment.center,
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
          ],
        ),
      ),
    );
  }
}
