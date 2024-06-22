import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../const/app_images.dart';
import 'state_raqust.dart';

class HadlingData extends StatelessWidget {
  final StateRaqust stateRaqust;
  final Widget child;

  const HadlingData({
    Key? key,
    required this.stateRaqust,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (stateRaqust == StateRaqust.Laoding) {
      return Lottie.asset(AppImages.loding);
    } else if (stateRaqust == StateRaqust.ofLineInternat) {
      return Lottie.asset(AppImages.noIntarnat);
    } else if (stateRaqust == StateRaqust.fuler) {
      return Lottie.asset(
        AppImages.isempty,
        alignment: Alignment.center,
      );
    } else if (stateRaqust == StateRaqust.fulerServer) {
      return ListView(children: [Lottie.asset(AppImages.pagenot)]);
    } else {
      return child;
    }
  }
}
