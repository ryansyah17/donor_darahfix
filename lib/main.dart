import 'package:donor_darah/controllers/daftardonor_controller.dart';
import 'package:donor_darah/controllers/input_notification_controller.dart';
import 'package:donor_darah/controllers/registercontroller.dart';
import 'package:donor_darah/provider/stokdarah_provider.dart';

import 'package:donor_darah/services/auth_services.dart';
import 'package:donor_darah/services/notification_services.dart';
import 'package:donor_darah/services/pendonor_services.dart';
import 'package:donor_darah/ui/pages/splash_page.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

int? initLogin;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initLogin = preferences.getInt('initLogin');
  // await preferences.setInt('initLogin', 1);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final urgentNotification = Get.put(
    NotificationServices(),
    permanent: true,
  );
  final daftarDonor = Get.put(
    PendonorServices(),
    permanent: true,
  );

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<DaftarDonorController>(() => DaftarDonorController());
    Get.lazyPut<InputNotificationController>(
        () => InputNotificationController());
    Get.lazyPut<RegisterController>(() => RegisterController());
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(),
        ),
        ChangeNotifierProvider(create: (context) => StokdarahProvider()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
      ),
    );
  }
}
