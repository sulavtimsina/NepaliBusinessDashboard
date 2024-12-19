import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nepalibussiness/controllers/filecontroller.dart';
import 'package:nepalibussiness/model/file_DataModel.dart';

class DroppedFileWidget extends StatelessWidget {
  DroppedFileWidget({Key? key}) : super(key: key);

  final FileController fileController = Get.find<FileController>();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Obx(() {
      final file = fileController.selectedFile.value;
      return Center(
        child: Container(
          width: screenSize.width * 0.35,
          height: screenSize.height * 0.35,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey,
              width: 2,
            ),
          ),
          child: file == null
              ? buildEmptyFile('No Selected Image')
              : buildImage(context, file),
        ),
      );
    });
  }

  Widget buildImage(BuildContext context, File_Data_Model file) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        file.url,
        fit: BoxFit.cover,
        errorBuilder: (context, error, _) =>
            buildEmptyFile('Image Load Failed'),
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildEmptyFile(String text) {
    return Center(
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
