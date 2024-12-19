import 'package:get/get.dart';
import 'package:nepalibussiness/model/file_DataModel.dart';

class FileController extends GetxController {
  final Rx<File_Data_Model?> selectedFile = Rx<File_Data_Model?>(null);

  void setFile(File_Data_Model file) {
    selectedFile.value = file;
  }

  void clearFile() {
    selectedFile.value = null;
  }
}
