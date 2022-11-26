import 'dart:math';

import 'package:body_fix2/body%20fix/core/utils/colors.dart';
import 'package:body_fix2/body%20fix/presentation/profile/pages%20item/edit_profile.dart';
import 'package:body_fix2/body%20fix/presentation/profile/widgets/card_item_profile.dart';
import 'package:body_fix2/body%20fix/presentation/widgets/custom_body_cont.dart';
import 'package:body_fix2/body%20fix/presentation/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: sqrt((Get.height + Get.width) * 2)),
          height: Get.height * 0.7,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomContainer(
                  height: sqrt((Get.height + Get.width) * 6),
                  width: sqrt((Get.height + Get.width) * 6),
                  borderRadius: 100,
                  child: const Text("")),
              const Text(
                "Ali Jawad Oribe",
                style: TextStyle(color: AppColors.black, fontSize: 18),
              ),
              const Text(
                "example@gmail.com",
                style: TextStyle(color: AppColors.black, fontSize: 18),
              ),
              CardItemProfile(
                  title: "Edit Profile",
                  iconData: Icons.edit_outlined,
                  onTap: () {
                    Get.to(() => EditProfile());
                  }),
              CardItemProfile(
                  title: "Policies and Terms",
                  iconData: Icons.description,
                  onTap: () {}),
              CardItemProfile(
                  title: "Sign out", iconData: Icons.logout, onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
