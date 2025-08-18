import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_routes.dart';
import '../../../domain/intities/CartResponseEntity.dart';
import '../pages/cart_screen/cartTabViewModel.dart';
import '../GetProductFromCart/FromCartProductScreen.dart';
import 'custom_txt.dart';
class CartItem extends StatelessWidget {
  GetProductEntity productItem;

  CartItem({required this.productItem});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, FromCartProductScreen.route,arguments: productItem);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Container(
          height: 142.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.r),
            border: Border.all(color: AppColors.primary30Opacity, width: 1),
          ),
          child: Row(
            children: [
              _buildImageContainer(productItem.product?.imageCover ?? ''),
              Expanded(
                child: Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
                  child: Column(
                    children: [
                      _buildItemHeader(productItem.product?.title ?? '',
                          context, productItem.product?.id ?? ''),
                      SizedBox(height: 5.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTxt(
                            text: 'Egy ${productItem.price}',
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ),
                          Container(
                            height: 50.h,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    int count = productItem.count!.toInt();
                                    count--;
                                    CartViewModel.get(context)
                                        .updateCountInCart(
                                        productItem.product?.id ?? "",
                                        count);
                                  },
                                  icon: Icon(
                                    Icons.remove_circle_outline_rounded,
                                    color: AppColors.whiteColor,
                                    size: 25.sp,
                                  ),
                                ),
                                CustomTxt(
                                  text: '${productItem.count}',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  fontColor: AppColors.whiteColor,
                                ),
                                IconButton(
                                  onPressed: () {
                                    //todo: increment count
                                    int count = productItem.count!.toInt();
                                    count++;
                                    CartViewModel.get(context)
                                        .updateCountInCart(
                                        productItem.product?.id ?? "",
                                        count);
                                  },
                                  icon: Icon(
                                    Icons.add_circle_outline_rounded,
                                    color: AppColors.whiteColor,
                                    size: 25.sp,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageContainer(String image) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.primary30Opacity, width: 1),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: CachedNetworkImage(
          width: 130.w,
          height: 145.h,
          fit: BoxFit.cover,
          imageUrl: image,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(
              color: AppColors.yellowColor,
            ),
          ),
          errorWidget: (context, url, error) => const Icon(
            Icons.error,
            color: AppColors.redColor,
          ),
        ),
      ),
    );
  }

  Widget _buildItemHeader(
      String title, BuildContext context, String productId) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: CustomTxt(text: title)),
        InkWell(
          onTap: () {
            // TODO: delete item from cart
            CartViewModel.get(context).deleteItemsInCart(productId);
          },
          child: Icon(
            CupertinoIcons.delete,
            color: AppColors.primaryColor,
            size: 25.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildItemPrice(String price, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomTxt(
          text: 'Egy $price',
          fontWeight: FontWeight.bold,
          fontSize: 18.sp,
        ),
        _buildQuantityControl(
            productItem.count!.toInt(), context, productItem.product?.id ?? ''),
      ],
    );
  }

  Widget _buildQuantityControl(
      int count, BuildContext context, String productId) {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {
              //todo: decrement count
              print('before decrement: NumOfCount: $count');
              CartViewModel.get(context).updateCountInCart(productId, count--);
              print('After decrement: NumOfCount: $count');
            },
            icon: Icon(
              Icons.remove_circle_outline_rounded,
              color: AppColors.whiteColor,
              size: 25.sp,
            ),
          ),
          CustomTxt(
            text: '$count',
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            fontColor: AppColors.whiteColor,
          ),
          IconButton(
            onPressed: () {
              //todo: increment count
              print('before increment: NumOfCount: $count');
              CartViewModel.get(context).updateCountInCart(productId, count++);
              print('After increment: NumOfCount: $count');
            },
            icon: Icon(
              Icons.add_circle_outline_rounded,
              color: AppColors.whiteColor,
              size: 25.sp,
            ),
          ),
        ],
      ),
    );
  }
}