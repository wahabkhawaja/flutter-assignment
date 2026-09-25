import 'package:flutter/material.dart';
import 'package:flutter_assignment/utils/app_constants.dart';

class VenuzeLogo extends StatelessWidget {
  const VenuzeLogo({super.key, this.size = 36, this.width, this.height});

  final double size;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppConstants.appLogo,
      width: width,
      height: height ?? size,
      fit: BoxFit.fill,
    );
  }
}
