
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

import '../../../DI/DI.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../../../domain/intities/CartResponseEntity.dart';
import 'GetSpecificProduct.dart';
import 'GetSpecificProductViewModel.dart';

class FromCartProductScreen extends StatefulWidget {
  FromCartProductScreen({super.key});
  static String route='getProductInitial';

  @override
  State<FromCartProductScreen> createState() => _FromCartProductScreenState();
}

class _FromCartProductScreenState extends State<FromCartProductScreen> {

  GetSpecificProductViewModel viewModel=getIt<GetSpecificProductViewModel>();
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as GetProductEntity;
    return
        BlocBuilder(
          bloc: viewModel..GetSpecificProduct(args.product!.id.toString()),
          builder:(context, state) {if (state is GetSpecificProductSuccessState){return
            Scaffold(
          appBar: AppBar(
            title: Text(
              "Product Details",
              style: AppStyles.semi20Primary,
            ),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    color: AppColors.primaryColor,
                    size: 30,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                    color: AppColors.primaryColor,
                  )),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 50.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImageSlideshow(
                      indicatorColor: AppColors.primaryColor,
                      initialPage: 0,
                      indicatorBottomPadding: 15.h,
                      indicatorPadding: 8.w,
                      indicatorRadius: 5,
                      indicatorBackgroundColor: AppColors.whiteColor,
                      isLoop: true,
                      autoPlayInterval: 3000,
                      height: 390.h,
                      children: state.getSpecificProductResponseEntity.data!.images!.map((url) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(15.r),
                          child: CachedNetworkImage(
                            width: 191.w,
                            height: 120.h,
                            fit: BoxFit.cover,
                            imageUrl: url,
                            placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primaryDark,
                              ),
                            ),
                            errorWidget: (context, url, error) => const Icon(
                              Icons.error,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        );
                      }).toList()),
                  SizedBox(
                    height: 24.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                         ' ${args.price}' ?? '',
                          style: AppStyles.medium18Header,
                        ),
                      ),
                      Text(
                        "EGP ${args.price}",
                        style: AppStyles.medium18Header,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Row(
                    children: [
                      Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColors.primaryColor.withOpacity(.3),
                              width: 1),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                        child: Text(
                           '${state.getSpecificProductResponseEntity.data!.sold} Sold',
                          overflow: TextOverflow.ellipsis,
                          style: AppStyles.medium14PrimaryDark,
                        ),
                      ),
                      SizedBox(
                        width: 16.w,
                      ),
                      Image.asset(
                        AppAssets.starIcon,
                        width: 20.w,
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                     Expanded(
                        child: Text(
                          "${state.getSpecificProductResponseEntity.data!.ratingsAverage} (${state.getSpecificProductResponseEntity.data!.ratingsQuantity})",
                          overflow: TextOverflow.ellipsis,
                          style: AppStyles.regular14Text,
                        ),
                     ),
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Description',
                        style: AppStyles.medium18Header,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      ReadMoreText(
                        state.getSpecificProductResponseEntity.data!.description??'',
                        style: AppStyles.medium14LightPrimary,
                        trimExpandedText: ' Read Less',
                        trimCollapsedText: ' Read More',
                        trimLines: 2,
                        trimMode: TrimMode.Line,
                        colorClickableText: AppColors.primaryColor,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            'Total price',
                            style: AppStyles.medium18Header.copyWith(
                                color: AppColors.primaryColor.withOpacity(0.6)),
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          Text('EGP ${args.price}', style: AppStyles.medium18Header)
                        ],
                      ),
                      SizedBox(
                        width: 33.w,
                      ),
                      Expanded(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(17.r)),
                              backgroundColor: AppColors.primaryColor,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 14.w, vertical: 14.h),
                            ),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add_shopping_cart,
                                  color: AppColors.whiteColor,
                                ),
                                SizedBox(
                                  width: 15.w,
                                ),
                                AutoSizeText("Add To Cart",
                                    style: AppStyles.medium20White),
                                SizedBox(
                                  width: 27.w,
                                ),
                              ],
                            )),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
                );}
          if(state is GetSpecificProductErrorState){return Container(color: AppColors.whiteColor,child: Text(state.errorMessage,style: AppStyles.semi20Primary,));}
          else {return Container(color:AppColors.whiteColor,child: Center(child: CircularProgressIndicator(color: AppColors.primaryColor,)));}}
        );}

  }