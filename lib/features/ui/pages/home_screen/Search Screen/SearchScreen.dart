import 'package:e_commerece_app/features/ui/pages/home_screen/Home_Screen_ViewModel.dart';
import 'package:e_commerece_app/features/ui/pages/home_screen/HomeScreenStates.dart';
import 'package:e_commerece_app/features/ui/pages/home_screen/tabs/products_tab/ProductTabStates.dart';
import 'package:e_commerece_app/features/ui/pages/home_screen/tabs/products_tab/ProductTabViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_routes.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../widgets/custom_badge.dart';
import '../../../widgets/product_tab_item.dart';
import '../../cart_screen/cartTabStates.dart';
import '../../cart_screen/cartTabViewModel.dart';

class SearchScreen extends StatefulWidget {
  static String route='search';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  HomeScreenViewModel viewModel = HomeScreenViewModel();

  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenViewModel, HomeScreenStates>(
      bloc: HomeScreenViewModel.get(context),
      builder: (context, state) {
        final searchList = HomeScreenViewModel.get(context).searchList;

        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 120.h,
            surfaceTintColor: AppColors.transparentColor,
            titleSpacing: 0,
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          onChanged: (value) {
                            HomeScreenViewModel.get(context)
                                .searching(value, context);
                          },
                          controller:
                          HomeScreenViewModel.get(context).searchText,
                          style: AppStyles.regular14Text,
                          cursorColor: AppColors.primaryColor,
                          decoration: InputDecoration(
                            border: _buildCustomBorder(),
                            enabledBorder: _buildCustomBorder(),
                            focusedBorder: _buildCustomBorder(),
                            contentPadding: EdgeInsets.all(16.h),
                            hintStyle: AppStyles.light14SearchHint,
                            hintText: "What do you search for?",
                            prefixIcon: Icon(
                              Icons.search,
                              size: 24.sp,
                              color: AppColors.primaryColor.withOpacity(0.75),
                            ),
                          ),
                        ),
                      ),
                      BlocBuilder<CartViewModel, CartStates>(
                        bloc: CartViewModel.get(context),
                        builder: (context, state) => CustomAppBarBadge(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          body: BlocBuilder(
            bloc: ProductViewModel.get(context),
            builder:(context, state) =>  SafeArea(
              child:ProductViewModel.get(context).productsList.isEmpty?
                  Center(child: CircularProgressIndicator()):
              searchList.isEmpty
                  ? const Center(child: Text("No results found"))
                  : GridView.builder(
                padding: EdgeInsets.all(16.w),
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3.2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: searchList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.productDetailsRoute,
                        arguments: searchList[index],
                      );
                    },
                    child: ProductTabItem(
                      productList: searchList,
                      index: index,
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

OutlineInputBorder _buildCustomBorder() {
  return OutlineInputBorder(
    borderSide: const BorderSide(
      color: AppColors.primaryColor,
      width: 1,
    ),
    borderRadius: BorderRadius.circular(50.r),
  );}