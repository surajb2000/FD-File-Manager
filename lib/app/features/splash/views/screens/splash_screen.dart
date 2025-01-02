library splash;

import 'package:file_manager/app/config/routes/app_pages.dart';
import 'package:file_manager/app/constans/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

// binding
part '../../bindings/splash_binding.dart';

// controller
part '../../controllers/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 2),
            Image.asset(ImageRaster.logo, height: 150),
            const Spacer(flex: 1),
            Obx(
              () => Visibility(
                  visible: controller.isLoading.value,
                  child: const CircularProgressIndicator()),
            ),
            const Spacer(flex: 1),
            ListTile(
              leading: Image.asset(ImageRaster.logo, height: 70),
              title: Text(
                "FD File Explorer",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              subtitle: Text(
                "Get More Out of Your Storage",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              // onTap: () => controller.goToYoutubeChannel(),
            )
          ],
        ),
      ),
    );
  }
}
