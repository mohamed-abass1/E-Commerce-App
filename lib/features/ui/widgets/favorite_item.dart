import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_routes.dart';
import '../../../core/utils/app_styles.dart';
import '../../../domain/intities/FavouriteResponseEntity.dart';
import '../pages/home_screen/tabs/favorite_tab/FavouriteTabStates.dart';
import '../pages/home_screen/tabs/favorite_tab/FavouriteTabViewModel.dart';
import '../pages/home_screen/tabs/products_tab/ProductTabViewModel.dart';
import 'custom_elevated_button.dart';

class FavoriteItem extends StatefulWidget {
  String heartIcon = AppAssets.selectedFavouriteIcon;
  bool isClicked = false;
  FavoriteItem({super.key, required this.product});
  FavouriteDataEntity product;

  @override
  State<FavoriteItem> createState() => _FavoriteItemState();
}
//FavouriteViewModel viewModel=getIt<FavouriteViewModel>();
class _FavoriteItemState extends State<FavoriteItem> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: FavouriteViewModel.get(context),

      builder: (context, state) =>
      state is RemoveFavouriteErrorState?Text(state.errorMsg):

          Padding(
                  padding: EdgeInsets.only(top: 10.h),
                  child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.productRoute,arguments: widget.product);
          },
          child: Container(
            height: 135.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(
                color: AppColors.primaryColor.withOpacity(.3),
              ),
            ),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(
                      color: AppColors.primaryColor.withOpacity(.6),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: CachedNetworkImage(
                      width: 120.w,
                      height: 135.h,
                      fit: BoxFit.cover,
                      imageUrl:widget.product.imageCover!,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      ),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.error,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 8.w, bottom: 8.h, left: 8.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: AutoSizeText(
                                widget.product.title!,
                                minFontSize:12,
                                overflow: TextOverflow.ellipsis,
                                maxFontSize:30,
                                maxLines: 1,

                                style: AppStyles.medium18Header,),
                            ),
                            InkWell(

                              // radius: 25,
                              customBorder: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              onTap: () {


                              },
                              child: Material(
                                // borderRadius: BorderRadius.circular(2),
                                color: AppColors.whiteColor,
                                elevation: 5,
                                shape: const StadiumBorder(),
                                shadowColor: AppColors.blackColor,
                                child: Padding(
                                    padding: const EdgeInsets.all(6),
                                    child: ImageIcon(
                                      AssetImage(AppAssets.selectedAddToFavouriteIcon),
                                      color: AppColors.primaryColor,
                                    )),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 10.w),
                              width: 14.w,
                              height: 14.h,
                              decoration: BoxDecoration(
                                color: AppColors.blackColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                            AutoSizeText(
                              "color" ,
                              style: AppStyles.regular14Text,
                            )
                          ],
                        ),
                        Row(
                          children: [InkWell(
                            onTap: () {
                               FavouriteViewModel.get(context).RemoveFavourites(widget.product.id!);
                                setState(() {

                                });},
                              child: Icon(Icons.remove_circle)),
                            AutoSizeText(
                              "EGP ${widget.product.price}",
                              style: AppStyles.medium18Header,
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            // AutoSizeText(overflow: TextOverflow.fade,
                            //   "EGP${widget.product.price!-80}",
                            //   style: AppStyles.regular11SalePrice.copyWith(
                            //       decoration: TextDecoration.lineThrough),
                            // ),
                            const Spacer(),
                            SizedBox(
                              width: 100.w,
                              height: 36.h,
                              child: CustomElevatedButton(
                                  text: "Add To Cart",
                                  onPressed: () {
                                    ProductViewModel.get(context).addToCart(widget.product.id!, context);
                                  },
                                  backgroundColor: AppColors.primaryColor,
                                  textStyle: AppStyles.medium14Category
                                      .copyWith(color: AppColors.whiteColor)),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
                  ),
                ),
    );
  }
}
