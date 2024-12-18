import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addData(String collection, Map<String, dynamic> data) async {
    try {
      await _firestore.collection(collection).add(data);
      print("Data added successfully!");
    } catch (e) {
      print("Error adding data: $e");
    }
  }

  Future<void> updateData(
      String collection, String docId, Map<String, dynamic> data) async {
    try {
      await _firestore.collection(collection).doc(docId).update(data);

      print("Data updated successfully!");
    } catch (e) {
      print("Error updating data: $e");
    }
  }

  Future<void> deleteData(String collection, String docId) async {
    try {
      await _firestore.collection(collection).doc(docId).delete();
      print("Data deleted successfully!");
    } catch (e) {
      print("Error deleting data: $e");
    }
  }
}
