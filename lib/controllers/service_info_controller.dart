import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nepalibussiness/controllers/filecontroller.dart';
import 'package:nepalibussiness/services/fireStoreServices.dart';

class ServiceInfoController extends GetxController {
  final TextEditingController imageUrl = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController category = TextEditingController();
  final TextEditingController location = TextEditingController();
  final TextEditingController descrpition = TextEditingController();
  final FileController file = FileController();

  var selectedRating = 0.obs;
  var isLoading = false.obs;

  RxBool isSaveButtonEnabled = false.obs;
  RxList<Map<String, dynamic>> businessData = <Map<String, dynamic>>[].obs;

  final FirestoreService firestoreService = FirestoreService();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  void updateRating(int rating) {
    selectedRating.value = rating;
    _validateFields();
  }

  @override
  void onInit() {
    super.onInit();
    imageUrl.addListener(_validateFields);
    name.addListener(_validateFields);
    category.addListener(_validateFields);
    location.addListener(_validateFields);
    descrpition.addListener(_validateFields);
    file.validateFile();
    fetchBusinessData();
  }

  void _validateFields() {
    isSaveButtonEnabled.value = name.text.isNotEmpty &&
        imageUrl.text.isNotEmpty &&
        category.text.isNotEmpty &&
        location.text.isNotEmpty &&
        descrpition.text.isNotEmpty &&
        selectedRating.value > 0;
  }

  void fetchBusinessData() {
    firestore.collection('Business').snapshots().listen((snapshot) {
      businessData.value = snapshot.docs
          .map((doc) => {'id': doc.id, ...doc.data() as Map<String, dynamic>})
          .toList();
    });
  }

  Future<void> deleteBusiness(String documentId) async {
    try {
      await FirebaseFirestore.instance
          .collection('Business') // Replace with your collection
          .doc(documentId)
          .delete();
      businessData.removeWhere((business) => business['id'] == documentId);

      Get.snackbar('Success', 'Business deleted successfully.');
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete business: $e');
    }
  }

  Future<void> saveDataToFirestore() async {
    isLoading.value = true;
    if (!isSaveButtonEnabled.value) return;

    try {
      await FirebaseFirestore.instance.collection('Business').add({
        'ImageUrl': imageUrl.text.trim(),
        'Name': name.text.trim(),
        'Category': category.text.trim(),
        'Location': location.text.trim(),
        'Description': descrpition.text.trim(),
        'Rating': selectedRating.value, // Save rating
      });
      Get.snackbar(
        "Success",
        "Data saved successfully!",
        snackPosition: SnackPosition.TOP,
      );
      imageUrl.clear();
      name.clear();
      category.clear();
      location.clear();
      descrpition.clear();
      selectedRating.value = 0;
      Get.toNamed('/dashboard');
    } catch (e) {
      Get.snackbar("Error", e.toString(),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }
}
