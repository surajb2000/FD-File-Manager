library home;

// import 'dart:io';

// import 'package:path_provider/path_provider.dart';
import 'package:disk_space_plus/disk_space_plus.dart';
import 'package:file_manager/app/constans/app_constants.dart';
import 'package:file_manager/app/shared_components/custom_button.dart';
import 'package:file_manager/app/shared_components/file_list_button.dart';
import 'package:file_manager/app/shared_components/header_text.dart';
import 'package:file_manager/app/shared_components/search_button.dart';
import 'package:file_manager/app/utils/helpers/app_helpers.dart';
import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

// binding
part '../../bindings/home_binding.dart';

// controller
part '../../controllers/home_controller.dart';

// model
part '../../models/usage.dart';
part '../../models/user.dart';

// component
part '../components/category.dart';
part '../components/header.dart';
part '../components/recent.dart';
part '../components/storage_chart.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverFillRemaining(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(kDefaultSpacing),
                  child: _Header(user: controller.user),
                ),
                Padding(
                  padding: const EdgeInsets.all(kDefaultSpacing),
                  child: _StorageChart(
                    totalFree: controller.totalFree.value,
                    totalUsed: controller.totalUsed.value,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(kDefaultSpacing),
                  child: _Category(),
                ),
                // Padding( //TODO
                //   padding: const EdgeInsets.all(kDefaultSpacing),
                //   child: _Recent(
                //     data: controller.recent,
                //   ),
                // ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
