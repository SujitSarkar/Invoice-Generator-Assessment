import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/router/router_paths.dart';
import '../../../../shared/data_sources/remote/api/api_endpoint_url.dart';
import '../../../../shared/data_sources/remote/api/remote_imports.dart';
import '../../../../shared/utils/app_toast.dart';
import '../model/vehicle_model.dart';

class VehicleController extends GetxController {
  final ApiClient _apiClient = ApiClient();

  final GlobalKey<FormState> formKey = GlobalKey();
  final RxBool isLoading = true.obs;
  final TextEditingController vehicleModelController = TextEditingController();

  final RxList<VehicleModel> vehicleList = <VehicleModel>[].obs;
  final RxList<VehicleModel> filteredVehicleList = <VehicleModel>[].obs;
  final RxList<String> vehicleTypes = <String>[].obs;
  final RxBool vehicleTypesIsSelected = true.obs;
  final RxList<String> vehicleModels = <String>[].obs;
  final Rxn<String> selectedVehicleType = Rxn();
  final Rxn<VehicleModel> selectedVehicle = Rxn();

  @override
  void onInit() async {
    isLoading(true);
    await fetchCars();
    isLoading(false);

    vehicleModelController.addListener(filterCarByModel);
    super.onInit();
  }

  @override
  void dispose() {
    vehicleModelController.removeListener(filterCarByModel);
    super.dispose();
  }

  void filterCarByModel() {
    if (selectedVehicleType.value != null) {
      debugPrint('selectedVehicle.value != null');
      filteredVehicleList.value = vehicleList
          .where((item) =>
              item.type! == selectedVehicleType.value! &&
              item.model!
                  .toLowerCase()
                  .contains(vehicleModelController.text.toLowerCase()))
          .toList();
    } else {
      debugPrint('selectedVehicle.value == null');
      filteredVehicleList.value = vehicleList
          .where((item) => item.model!
              .toLowerCase()
              .contains(vehicleModelController.text.toLowerCase()))
          .toList();
    }
  }

  void filterCarByType() {
    if (selectedVehicleType.value != null) {
      filteredVehicleList.value = vehicleList
          .where((item) => item.type! == selectedVehicleType.value!)
          .toList();
    }
  }

  Future<void> fetchCars() async {
    vehicleList.clear();
    filteredVehicleList.clear();
    try {
      final result = await _apiClient.getRequest(path: ApiEndpointUrl.carList);
      if (result.data != null) {
        vehicleList.value =
            vehicleModelFromJson(jsonEncode(result.data['data']));
        filteredVehicleList.addAll(vehicleList);
        filterVehicleModelsAndTypes();
        debugPrint('Total Vahicles: ${vehicleList.length}');
      }
    } catch (error) {
      showToast(error.toString());
    }
  }

  void filterVehicleModelsAndTypes() {
    vehicleTypes.clear();
    vehicleModels.clear();
    Set<String> typesSet = {};
    Set<String> modelsSet = {};
    for (VehicleModel vehicle in filteredVehicleList) {
      if (vehicle.type != null) {
        typesSet.add(vehicle.type!);
      }
      if (vehicle.model != null) {
        modelsSet.add(vehicle.model!);
      }
    }
    vehicleTypes.addAll(typesSet);
    vehicleModels.addAll(modelsSet);
  }

  void changeVehicleType(String? value) {
    if (value != null) {
      selectedVehicleType(value);

      selectedVehicle.value = null;
      vehicleTypesIsSelected.value = true;
      vehicleModelController.clear();
      filterCarByType();
    }
  }

  void vehicleOnTap(VehicleModel model) {
    if (selectedVehicle.value == model) {
      selectedVehicle.value = null;
      vehicleModelController.clear();
      filterCarByType();
    } else {
      selectedVehicle(model);
      vehicleModelController.text = selectedVehicle.value!.model!;
    }
  }

  void nextButtonOnTap() {
    if (selectedVehicleType.value == null) {
      vehicleTypesIsSelected.value = false;
      return;
    }
    if (formKey.currentState!.validate()) {
      if (selectedVehicle.value == null) {
        showToast('Select a vehicle');
        return;
      }
      vehicleTypesIsSelected.value = true;
      Get.toNamed(RouterPaths.additionalCharge);
    }
  }
}
