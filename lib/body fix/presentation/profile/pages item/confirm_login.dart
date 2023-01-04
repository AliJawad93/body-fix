import 'dart:math';

import 'package:body_fix2/body%20fix/core/utils/colors.dart';
import 'package:body_fix2/body%20fix/core/utils/images_path.dart';
import 'package:body_fix2/body%20fix/data/auth.dart';
import 'package:body_fix2/body%20fix/presentation/auth/widgets/custom_text_form.dart';
import 'package:body_fix2/body%20fix/presentation/home/home.dart';
import 'package:body_fix2/body%20fix/presentation/loading/loading.dart';
import 'package:body_fix2/body%20fix/presentation/widgets/custom_body_cont.dart';
import 'package:body_fix2/body%20fix/presentation/widgets/custom_elevated_button.dart';
import 'package:body_fix2/body%20fix/services/general_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ConfirmLogin extends StatefulWidget {
  ConfirmLogin({super.key, required this.changeFunction});
  Future<void> Function() changeFunction;

  @override
  State<ConfirmLogin> createState() => _ConfirmLoginState();
}

class _ConfirmLoginState extends State<ConfirmLogin> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(title: Text("Confirm Login")),
      body: isLoading
          ? Loading()
          : SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: sqrt((Get.height + Get.width) * 2)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppImagePath.confirmationLogin,
                      width: 300,
                    ),
                    CustomTextForm(
                      hintText: "Current Email",
                      controller: email,
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                    CustomTextForm(
                      hintText: "Current password",
                      obscureText: true,
                      controller: password,
                      prefixIcon: Icon(Icons.lock_outline),
                    ),
                    CustomElevatedButton(
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });
                          bool isConfirmed =
                              await FirebaseAuthentication.confirmLogin(
                                  email: email.text, password: password.text);
                          if (!isConfirmed) {
                            setState(() {
                              isLoading = false;
                            });

                            return;
                          }

                          await widget.changeFunction();
                          setState(() {
                            isLoading = false;
                          });
                          Get.offAll(() => Home());
                          GeneralServices.snackBar(
                              title: "success", message: "Update successed");
                        },
                        child: Text("Confirm")),
                  ],
                ),
              ),
            ),
    );
  }
}
