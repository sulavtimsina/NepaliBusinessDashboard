import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nepalibussiness/model/file_DataModel.dart';

class DroppedFileWidget extends StatelessWidget {
  final File_Data_Model? file;

  const DroppedFileWidget({Key? key, required this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Center(
      child: Container(
        width: screenWidth * 0.35, // Fixed width for the container
        height: screenHeight * 0.35, // Fixed height for the container
        decoration: BoxDecoration(
          color: Colors.grey.shade200, // Background color
          borderRadius: BorderRadius.circular(10), // Rounded corners
          border: Border.all(
            color: Colors.grey, // Border color
            width: 2, // Border width
          ),
        ),
        child: file == null
            ? buildEmptyFile('No Selected Image')
            : buildImage(context),
      ),
    );
  }

  Widget buildImage(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        file!.url,
        fit: BoxFit.cover, // Ensure the image fills the container
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
