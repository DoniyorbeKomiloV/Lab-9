import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_9/main_screeen.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'registration_screen.dart';

void main() {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
  runApp(const NavigationMenu());
}

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: Obx(() => NavigationBar(
              height: 80,
              elevation: 0,
              selectedIndex: controller.currentIndex.value,
              onDestinationSelected: (int index) => controller.currentIndex.value = index,
              destinations: const [
                NavigationDestination(
                  selectedIcon: Icon(Icons.app_registration),
                  icon: Icon(Icons.app_registration_rounded),
                  label: 'Registration',
                ),
                NavigationDestination(
                  icon: Badge(child: Icon(Icons.person_sharp)),
                  label: 'Users',
                ),
              ],
            )),
        body: Obx(() => controller.screens[controller.currentIndex.value]),
      ),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> currentIndex = 0.obs;
  final screens = [const RegistrationScreen(), const MainScreen()];
}
