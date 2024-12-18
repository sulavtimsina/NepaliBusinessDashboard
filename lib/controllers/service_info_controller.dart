import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ServiceInfoController extends GetxController {
  final TextEditingController name = TextEditingController();
  final TextEditingController category = TextEditingController();
  final TextEditingController location = TextEditingController();
  final TextEditingController descrpition = TextEditingController();
  var selectedRating = 0.obs;

  // Functions
  void updateRating(int rating) {
    selectedRating.value = rating;
  }
}
