import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_routes.dart';
import '../pages/cart_screen/cartTabViewModel.dart';

class CustomAppBarBadge extends StatefulWidget {
   CustomAppBarBadge();

  @override
  State<CustomAppBarBadge> createState() => _CustomAppBarBadgeState();
}

class _CustomAppBarBadgeState extends State<CustomAppBarBadge> {
  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    return InkWell(
      onTap: currentRoute != AppRoutes.cartRoute
          ? () {
              Navigator.of(context).pushNamed(AppRoutes.cartRoute);
              setState(() {

              });
            }
          : null,
      child: Badge(
        alignment: AlignmentDirectional.topStart,
        backgroundColor: AppColors.greenColor,
        label: Text(CartViewModel.get(context).numOfCart.toString()),
        child: ImageIcon(
          const AssetImage(AppAssets.shoppingCart),
          size: 35.sp,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
