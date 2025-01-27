import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BusinessController extends GetxController {
  final imageController = TextEditingController();
  final nameController = TextEditingController();
  final categoryController = TextEditingController();
  final locationController = TextEditingController();
  final descriptionController = TextEditingController();
  final ownerName = TextEditingController();
  final contactNumber = TextEditingController();
  final emailAddress = TextEditingController();
  final websiteURL = TextEditingController();
  final facebook = TextEditingController();
  final instagram = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final zipCode = TextEditingController();
  final country = TextEditingController();
  final languageSpoken = TextEditingController();
  final operatingHours = TextEditingController();
  final paymentMethod = TextEditingController();
  final specialOffers = TextEditingController();
  final verificationStatus = TextEditingController();

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
        imageController.text = data['ImageUrl'] ?? '';
        nameController.text = data['Name'] ?? '';
        categoryController.text = data['Category'] ?? '';
        locationController.text = data['Location'] ?? '';
        descriptionController.text = data['Description'] ?? '';
        ownerName.text = data['OwnerName'] ?? '';
        contactNumber.text = data['ContactNumber'] ?? '';
        emailAddress.text = data['EmailAddress'] ?? '';
        websiteURL.text = data['WebsiteURL'] ?? '';
        facebook.text = data['Facebook'] ?? '';
        instagram.text = data['Instagram'] ?? '';
        city.text = data['City'] ?? '';
        state.text = data['StateRegion'] ?? '';
        zipCode.text = data['Zipcode'] ?? '';
        country.text = data['Country'] ?? '';
        languageSpoken.text = data['LanguageSpoken'] ?? '';
        operatingHours.text = data['OperatingHours'] ?? '';
        paymentMethod.text = data['PaymentMethods'] ?? '';
        specialOffers.text = data['SpecialOffers'] ?? '';
        verificationStatus.text = data['VerificationStatus'] ?? '';
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
        'ImageUrl': imageController.text.trim(),
        'Name': nameController.text.trim(),
        'Category': categoryController.text.trim(),
        'Location': locationController.text.trim(),
        'Description': descriptionController.text.trim(),
        'OwnerName': ownerName.text.trim(),
        'ContactNumber': contactNumber.text.trim(),
        'EmailAddress': emailAddress.text.trim(),
        'WebsiteURL': websiteURL.text.trim(),
        'Facebook': facebook.text.trim(),
        'Instagram': instagram.text.trim(),
        'City': city.text.trim(),
        'StateRegion': state.text.trim(),
        'Zipcode': zipCode.text.trim(),
        'Country': country.text.trim(),
        'LanguageSpoken': languageSpoken.text.trim(),
        'OperatingHours': operatingHours.text.trim(),
        'PaymentMethods': paymentMethod.text.trim(),
        'SpecialOffers': specialOffers.text.trim(),
        'VerificationStatus': verificationStatus.text.trim(),
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
    imageController.dispose();
    nameController.dispose();
    categoryController.dispose();
    locationController.dispose();
    descriptionController.dispose();
    ownerName.dispose();
    contactNumber.dispose();
    emailAddress.dispose();
    websiteURL.dispose();
    facebook.dispose();
    instagram.dispose();
    city.dispose();
    state.dispose();
    zipCode.dispose();
    country.dispose();
    languageSpoken.dispose();
    operatingHours.dispose();
    paymentMethod.dispose();
    specialOffers.dispose();
    verificationStatus.dispose();
    super.onClose();
  }
}
