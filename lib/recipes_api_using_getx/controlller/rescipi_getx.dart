import 'dart:convert';

import 'package:get/get.dart';
import 'package:product_api/recipes_api_using_getx/helper/product_api.dart';
import 'package:product_api/recipes_api_using_getx/modal/recipes_modal.dart';

class RecipesController extends GetxController {
  RxBool isLoading = false.obs;
  RecipesModal? recipesModal;

  @override
  void onInit() {
    super.onInit();
    dataFetch();
  }
  Future<void> dataFetch() async {
    isLoading.value = true;

    RecipesApi recipesApi = RecipesApi();
    String? data = await recipesApi.apicalled();

    if (data != null) {
      try {
        Map<String, dynamic> json = jsonDecode(data);
        recipesModal = RecipesModal.fromJson(json);
      } catch (e) {
        // Handle JSON parsing error
        print('Error parsing JSON: $e');
      }
    } else {
      // Handle null data
      print('Error: No data received');
    }

    isLoading.value = false;
  }
}
