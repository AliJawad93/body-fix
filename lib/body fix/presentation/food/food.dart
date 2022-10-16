import 'package:body_fix2/body%20fix/core/utils/colors.dart';
import 'package:body_fix2/body%20fix/core/utils/images_path.dart';
import 'package:body_fix2/body%20fix/presentation/widgets/custom_body_cont.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Food extends StatelessWidget {
  const Food({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        appBar: AppBar(
          title: Text("Food"),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Foods:",
              style: TextStyle(color: AppColors.black),
            )
          ],
        ));
  }
}
