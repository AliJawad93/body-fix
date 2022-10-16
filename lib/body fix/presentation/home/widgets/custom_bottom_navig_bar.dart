import 'package:body_fix2/body%20fix/presentation/home/widgets/custom_Icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: 10.0,
      elevation: 10,
      shape: const CircularNotchedRectangle(),
      child: SizedBox(
        height: Get.height * 0.085,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: Get.width * 0.45,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  CustomIconBottomBar(
                    indexPage: 1,
                    iconData: Icons.local_dining,
                    size: 30,
                  ),
                  CustomIconBottomBar(
                    indexPage: 2,
                    iconData: Icons.fitness_center,
                    size: 30,
                  ),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: Get.width * 0.45,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  CustomIconBottomBar(
                    indexPage: 3,
                    iconData: Icons.directions_run,
                    size: 35,
                  ),
                  CustomIconBottomBar(
                    indexPage: 4,
                    iconData: Icons.account_circle,
                    size: 30,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
