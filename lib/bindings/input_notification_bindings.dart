import 'package:donor_darah/controllers/input_notification_controller.dart';
import 'package:get/get.dart';

class InputNotificationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InputNotificationController>(
        () => InputNotificationController());
  }
}
