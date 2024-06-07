import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../shared/data_sources/remote/api/api_endpoint_url.dart';
import '../../../../shared/data_sources/remote/api/remote_imports.dart';
import '../../../../shared/utils/app_toast.dart';
import '../model/vehicle_model.dart';

class VehicleController extends GetxController {
  final ApiClient _apiClient = ApiClient();

  final RxBool isLoading = true.obs;
  final TextEditingController vehicleModel = TextEditingController();

  final RxList<VehicleModel> vehicleList = <VehicleModel>[].obs;
  final RxList<VehicleModel> filteredVehicleList = <VehicleModel>[].obs;
  final RxList<String> vehicleTypes = <String>[].obs;
  final RxList<String> vehicleModels = <String>[].obs;
  final Rxn<String> selectedVehicleType = Rxn();

  @override
  void onInit() async {
    isLoading(true);
    await fetchCars();
    isLoading(false);
    super.onInit();
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
        debugPrint('Total Cars: ${vehicleList.length}');
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

  void chanheVehicleType(String value) {
    selectedVehicleType(value);
    filteredVehicleList.value = vehicleList
        .where((item) => item.type!.contains(selectedVehicleType.value!))
        .toList();
  }
}
