import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BusinessController extends GetxController {
  final nameController = TextEditingController();
  final categoryController = TextEditingController();
  final locationController = TextEditingController();
  final descriptionController = TextEditingController();

  var businessList = <Map<String, dynamic>>[].obs; // List of all businesses
  var isLoading = false.obs; // For showing a loading spinner
  RxInt selectedRating = 0.obs; // Selected rating for business

  Future<void> fetchAllBusinesses() async {
    try {
      isLoading.value = true;
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('Business').get();
      businessList.value = snapshot.docs
          .map((doc) => {'id': doc.id, ...doc.data() as Map<String, dynamic>})
          .toList();
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch businesses: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchBusinessById(String documentId) async {
    try {
      isLoading.value = true;
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('Business')
          .doc(documentId)
          .get();

      if (snapshot.exists) {
        final data = snapshot.data() as Map<String, dynamic>;

        nameController.text = data['Name'] ?? '';
        categoryController.text = data['Category'] ?? '';
        locationController.text = data['Location'] ?? '';
        descriptionController.text = data['Description'] ?? '';
        selectedRating.value = data['Rating'] ?? 0;
      } else {
        Get.snackbar('Error', 'Business not found');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch business: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateBusiness(String documentId) async {
    try {
      isLoading.value = true;

      await FirebaseFirestore.instance
          .collection('Business')
          .doc(documentId)
          .update({
        'Name': nameController.text.trim(),
        'Category': categoryController.text.trim(),
        'Location': locationController.text.trim(),
        'Description': descriptionController.text.trim(),
        'Rating': selectedRating.value,
      });

      Get.snackbar('Success', 'Business updated successfully');
      fetchAllBusinesses(); // Refresh the list
      Get.toNamed('/dashboard');
    } catch (e) {
      Get.snackbar('Error', 'Failed to update business: $e');
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    categoryController.dispose();
    locationController.dispose();
    descriptionController.dispose();
    super.onClose();
  }
}
