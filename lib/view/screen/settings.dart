import 'package:ecommerceapp/controller/settings_controller.dart';
import 'package:ecommerceapp/core/constant/color.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingsPageController());
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 130,
                decoration: BoxDecoration(
                  color: AppColor.secondaryColor,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(25),
                  ),
                ),
              ),
              Positioned(
                top: 78,
                left: MediaQuery.of(context).size.width * 0.5 - 50,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: AppColor.appbarcolor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("assets/images/avatar.png"),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 100),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SizedBox(
              height: 315,
              child: GetBuilder<SettingsPageController>(
                builder:
                    (controller) => Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                "Disable Notification",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              trailing: Switch(
                                value: true,
                                onChanged: (val) {
                                  val = false;
                                },
                              ),
                            ),
                            ListTile(
                              onTap: () {
                                Get.toNamed(AppRoute.addressview);
                              },
                              title: Text(
                                "Address",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              trailing: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.location_on_outlined,
                                  size: 28,
                                ),
                              ),
                            ),
                            ListTile(
                              onTap: () {},

                              title: Text(
                                "About us",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              trailing: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.help_outline_rounded,
                                  size: 28,
                                ),
                              ),
                            ),
                            ListTile(
                              onTap: () {},

                              title: Text(
                                "Concat us",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              trailing: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.phone_callback_outlined,
                                  size: 28,
                                ),
                              ),
                            ),
                            ListTile(
                              title: Text(
                                "Logout",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              trailing: IconButton(
                                onPressed: () {
                                  controller.logout();
                                },
                                icon: Icon(
                                  Icons.exit_to_app_outlined,
                                  size: 28,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
