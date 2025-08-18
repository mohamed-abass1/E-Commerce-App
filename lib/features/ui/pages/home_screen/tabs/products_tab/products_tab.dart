import 'package:e_commerece_online_c13/core/utils/app_colors.dart';
import 'package:e_commerece_online_c13/features/ui/pages/home_screen/tabs/products_tab/ProductTabStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../../../DI/DI.dart';
import '../../../../../../core/utils/app_routes.dart';
import '../../../../widgets/product_tab_item.dart';
import 'ProductTabViewModel.dart';

class ProductsTab extends StatelessWidget {
  ProductViewModel viewModel =getIt<ProductViewModel>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductViewModel,ProductTabStates>(
      listener: (context, state) =>  {if (state is AddToCartSuccessState) {
      Fluttertoast.showToast(
        msg: 'added successfully.',
        backgroundColor: AppColors.greenColor,
      )
    } else if (state is AddToCartErrorState) {
    Fluttertoast.showToast(
    msg: state.errorMsg,
    backgroundColor: AppColors.redColor)}},
      child:
          BlocBuilder<ProductViewModel,ProductTabStates>(
            bloc: viewModel..getAllProducts(),
            builder: (context, state) {
            return SafeArea(child:
              state is ProductLoadingState? Center(child: const CircularProgressIndicator(color: AppColors.blueColor,)):
           Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
            Expanded(
                child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3.2.h,
                  crossAxisSpacing: 16.w,
                  mainAxisSpacing: 16.h),
              itemCount: viewModel.productsList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.productRoute,arguments: viewModel.productsList[index]);
                  },
                  child:  ProductTabItem(productList: viewModel.productsList,index: index,),
                );
              },
            ))
                    ],
                  ));}
          ),
    );
  }
}
