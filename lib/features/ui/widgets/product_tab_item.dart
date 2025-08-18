import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerece_online_c13/DI/DI.dart';
import 'package:e_commerece_online_c13/features/ui/pages/home_screen/tabs/favorite_tab/FavouriteTabStates.dart';
import 'package:e_commerece_online_c13/features/ui/pages/home_screen/tabs/favorite_tab/FavouriteTabViewModel.dart';
import 'package:e_commerece_online_c13/features/ui/pages/home_screen/tabs/products_tab/ProductTabViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../../../domain/intities/FavouriteResponseEntity.dart';
import '../../../domain/intities/ProductResponseEntity.dart';
import 'custom_txt.dart';

class ProductTabItem extends StatelessWidget {
  ProductTabItem({required this.productList, required this.index});

  int index;
  List<FavouriteDataEntity> productList;

  Widget build(BuildContext context) {
    FavouriteViewModel viewModel = FavouriteViewModel.get(context);
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: AppColors.primary30Opacity, width: 2)),
      child: Column(
          children: [
      Stack(
      children: [
      ClipRRect(
      borderRadius: BorderRadius.circular(15.r),
      child: CachedNetworkImage(
        width: 191.w,
        height: 120.h,
        fit: BoxFit.cover,
        imageUrl:
        productList[index].imageCover!,
        placeholder: (context, url) =>
        const Center(
          child: CircularProgressIndicator(
            color: AppColors.primaryDark,
          ),
        ),
        errorWidget: (context, url, error) =>
        const Icon(
          Icons.error,
          color: AppColors.redColor,
        ),
      ),
    ),
    BlocConsumer<FavouriteViewModel,FavouriteTabStates>(
    listener: (BuildContext context, state) {
      {
        if (state is AddFavouriteSuccessState) {
    Fluttertoast.showToast(
    msg: 'added',
    backgroundColor: AppColors.greenColor,
    );
    }
        else if (state is AddFavouriteErrorState) {
    Fluttertoast.showToast(
    msg: state.errorMsg,
    backgroundColor: AppColors.redColor); }

        if (state is RemoveFavouriteSuccessState) {
          Fluttertoast.showToast(
            msg: 'Removed',
            backgroundColor: AppColors.greenColor,
          );
        }
        else if (state is RemoveFavouriteErrorState) {
          Fluttertoast.showToast(
              msg: state.errorMsg,
              backgroundColor: AppColors.redColor); }

      }},
    bloc: viewModel,
    builder:(context, state) =>
       viewModel.checkIsFavourite(productList[index].id!, context, productList, index),
    )
    ],
    ),
    Padding(
    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    CustomTxt(
    text: productList[index].title!,
    fontSize: 12.sp,
    ),
    SizedBox(
    height: 2.h,
    ),
    CustomTxt(
    text: '${productList[index].slug}',
    fontSize: 12.sp,
    ),
    SizedBox(
    height: 1.h,
    ),
    Row(children: [
    CustomTxt(
    text: productList[index].price.toString(),
    ),
    SizedBox(
    width: 8.w,
    ),
    CustomTxt(
    text:' ${productList[index].price}',
    textStyle: AppStyles.regular11SalePrice
        .copyWith(decoration: TextDecoration.lineThrough),
    ),
    ]),
    SizedBox(
    height: 1.h,
    ),
    Row(
    children: [
    CustomTxt(
    text: productList[index].ratingsQuantity.toString(),
    fontSize: 12.sp,
    ),
    Icon(
    Icons.star,
    color: AppColors.yellowColor,
    size: 25.sp,
    ),
    const Spacer(
    flex: 1,
    ),
    InkWell(
    onTap: () {
    ProductViewModel.get(context).addToCart(productList[index].id!,context);
    //   todo add to cart
    },
    splashColor: Colors.transparent,
    child: Icon(
    Icons.add_circle,
    size: 32.sp,
    color: AppColors.primaryColor,
    ),
    )
    ],
    )
    ],
    ),
    )
    ],
    ),
    );
    }
    }
