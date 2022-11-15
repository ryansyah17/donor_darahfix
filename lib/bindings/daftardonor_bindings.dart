import 'package:donor_darah/controllers/daftardonor_controller.dart';
import 'package:get/get.dart';

class InputNotificationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DaftarDonorController>(() => DaftarDonorController());
  }
}
