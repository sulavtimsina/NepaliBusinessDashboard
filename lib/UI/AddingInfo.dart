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
            // Form and File Widgets
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
                          child: SizedBox(
                            height: screenHeight * 0.3,
                            child: DroppedFileWidget(file: file),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: DropZoneWidget(
                            onDroppedFile: (file) =>
                                setState(() => this.file = file),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Input Fields
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: screenWidth * 0.3,
                          child: TextFormField(
                            decoration:
                                const InputDecoration(labelText: 'Name'),
                          ),
                        ),
                        const SizedBox(width: 20),
                        SizedBox(
                          width: screenWidth * 0.3,
                          child: TextFormField(
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
                            decoration: InputDecoration(labelText: 'Location'),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Container(
                          width: screenWidth * 0.3,
                          child: TextFormField(
                            decoration:
                                InputDecoration(labelText: 'Description'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Rating Section
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
                        Row(
                          children: List.generate(
                            5,
                            (index) => const Icon(Icons.star_border, size: 30),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Add Button
                    SizedBox(
                      width: screenWidth * 0.25,
                      height: 45,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: utils.pimaryColor,
                        ),
                        onPressed: () {
                          // Add your functionality here
                        },
                        child: const Text(
                          'Add',
                          style: TextStyle(
                            color: Colors.white,
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
      ),
    );
  }
}
