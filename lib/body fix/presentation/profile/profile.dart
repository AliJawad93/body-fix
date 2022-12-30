import 'dart:math';

import 'package:body_fix2/body%20fix/core/utils/colors.dart';
import 'package:body_fix2/body%20fix/data/auth.dart';
import 'package:body_fix2/body%20fix/presentation/loading/loading.dart';
import 'package:body_fix2/body%20fix/presentation/profile/pages%20item/edit_profile.dart';
import 'package:body_fix2/body%20fix/presentation/profile/widgets/card_item_profile.dart';
import 'package:body_fix2/body%20fix/presentation/widgets/custom_body_cont.dart';
import 'package:body_fix2/body%20fix/presentation/widgets/custom_container.dart';
import 'package:body_fix2/body%20fix/services/shareprefs_keys.dart';
import 'package:body_fix2/main.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../auth/login.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: isLoading
          ? Loading()
          : Center(
              child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: sqrt((Get.height + Get.width) * 0.2)),
                height: Get.height * 0.7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomContainer(
                      height: sqrt((Get.height + Get.width) * 8),
                      width: sqrt((Get.height + Get.width) * 8),
                      borderRadius: 100,
                      child: ClipOval(
                        child: CachedNetworkImage(
                          imageUrl:
                              prefs.getString(SharePrefsKeys.urlImage) ?? "",
                          placeholder: (context, url) => const Icon(
                            Icons.person,
                            color: AppColors.darkGray,
                            size: 35,
                          ),
                          errorWidget: (context, url, error) => const Icon(
                            Icons.person,
                            color: AppColors.darkGray,
                            size: 35,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      prefs.getString(SharePrefsKeys.name) ?? "",
                      style:
                          const TextStyle(color: AppColors.black, fontSize: 18),
                    ),
                    Text(
                      prefs.getString(SharePrefsKeys.email) ?? "",
                      style:
                          const TextStyle(color: AppColors.black, fontSize: 18),
                    ),
                    Text(
                      prefs.getString(SharePrefsKeys.birthDay) ?? "",
                      style:
                          const TextStyle(color: AppColors.black, fontSize: 18),
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
                        title: "Sign out",
                        iconData: Icons.logout,
                        onTap: () async {
                          try {
                            setState(() {
                              isLoading = true;
                            });
                            FirebaseAuthentication.signOut();
                            await prefs.setBool(
                                SharePrefsKeys.isLogedin, false);
                            setState(() {
                              isLoading = false;
                            });
                            Get.offAll(() => Login());
                          } catch (e) {
                            Get.snackbar('error', e.toString());
                          }
                        }),
                  ],
                ),
              ),
            ),
    );
  }
}
