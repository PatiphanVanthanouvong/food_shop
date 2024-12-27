import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:s_shop_lao/src/services/theme_service.dart';

class AssetIcon extends StatelessWidget {
  const AssetIcon(
    this.icon, {
    super.key,
    this.color,
    this.size,
  });
  final String icon;
  final Color? color;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/$icon.svg',
      width: size,
      height: size,
      colorFilter: ColorFilter.mode(
        color ?? context.color.text,
        BlendMode.srcIn,
      ),
    );
  }
}
