import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helper/db_helper.dart';

class ContactController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final names = <String>[].obs;
  final _dbHelper = DBHelper();

  @override
  void onInit() {
    super.onInit();
    fetchNames();
  }

  Future<void> fetchNames() async {
    final data = await _dbHelper.getNames();
    names.value = data.map((e) => e['name'] as String).toList();
  }

  Future<void> addName() async {
    final text = nameController.text.trim();
    if (text.isEmpty) return;
    await _dbHelper.insertName(text);
    nameController.clear();
    fetchNames();
  }

  Future<void> deleteName(String name) async {
  await _dbHelper.deleteName(name);
  fetchNames();
}

Future<void> updateName2(String oldName, String newName) async {
  if (newName.trim().isEmpty) return;
  await _dbHelper.updateName(oldName, newName);
  fetchNames();
}



  @override
  void onClose() {
    nameController.dispose();
    super.onClose();
  }

  void updateName(int id, String trim) {}
}
