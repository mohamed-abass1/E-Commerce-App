import 'package:auto_size_text/auto_size_text.dart';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../../../../DI/DI.dart';
import '../../../../../../../../core/utils/app_assets.dart';
import '../../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../../core/utils/app_routes.dart';
import '../../../../../../../../core/utils/app_styles.dart';
import '../../../../../../../../core/utils/dialog_utils.dart';
import '../../../../../../../../core/utils/validators.dart';
import '../../../../../../widgets/custom_elevated_button.dart';
import '../../../../../../widgets/custom_text_form_field.dart';
import 'AddLocationViewModel.dart';
import 'AddLocationViewModelStates.dart';

class AddLocation extends StatefulWidget {
  static String route='AddLocation';
  @override
  State<AddLocation> createState() => _AddLocationState();
}
class _AddLocationState extends State<AddLocation> {
  AddLocationViewModel viewModel=getIt<AddLocationViewModel>();
  @override
  Widget build(BuildContext context) {

    return BlocListener<AddLocationViewModel,AddLocationStates>(
      bloc:viewModel,
      listener:(context, state) async {
      if (state is AddLocationLoadingState) {
        DialogUtils.showLoading(context: context, message: 'Waiting...');
      } else if (state is AddLocationErrorState) {
        DialogUtils.hideLoading(context);
        DialogUtils.showMessage(
            context: context,
            message: state.errorMsg,
            title: 'Error',
            posActionName: 'Ok');
      } else if (state is AddLocationSuccessState) {
        DialogUtils.hideLoading(context);
        DialogUtils.showMessage(
          context: context,
          message: 'Location Added Successfully',
          title: 'Success',
          posAction:(){Navigator.pushNamed(context, AppRoutes.homeRoute);},
          posActionName: 'Ok',);
      }},
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 91.h, bottom: 87.h, left: 97.w, right: 97.w),
                  child: Image.asset(
                    AppAssets.appBarLeading,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AutoSizeText(
                        'Add Your Details & Location',
                        style: AppStyles.semi24White,
                        maxLines: 1,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 40.h),
                        child: Form(
                          key: viewModel.formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                "name",
                                style: AppStyles.medium18White,
                              ),
                              CustomTextFormField(
                                  keyboardType: TextInputType.text,
                                  hintText: "enter your Name",
                                  hintStyle: AppStyles.light18HintText,
                                  filledColor: AppColors.whiteColor,
                                  controller: viewModel.nameController,),
                              Text(
                                "details",
                                style: AppStyles.medium18White,
                              ),
                              CustomTextFormField(
                                keyboardType: TextInputType.visiblePassword,
                                hintText: "Details",
                                hintStyle: AppStyles.light18HintText,
                                filledColor: AppColors.whiteColor,
                                controller: viewModel.detailsController,
                              ),
                              Text(
                                "Phone",
                                style: AppStyles.medium18White,
                              ),
                              CustomTextFormField(
                                keyboardType: TextInputType.visiblePassword,
                                hintText: " Phone",
                                hintStyle: AppStyles.light18HintText,
                                filledColor: AppColors.whiteColor,
                                controller: viewModel.phoneController,
                              ),
                              Text(
                                "City",
                                style: AppStyles.medium18White,
                              ),
                              CustomTextFormField(
                                keyboardType: TextInputType.visiblePassword,
                                hintText: " City",
                                hintStyle: AppStyles.light18HintText,
                                filledColor: AppColors.whiteColor,
                                controller: viewModel.cityController,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 35.h),
                                child: CustomElevatedButton(
                                    backgroundColor: AppColors.whiteColor,
                                    textStyle: AppStyles.semi20Primary,
                                    text: "Add Location",
                                    onPressed: () {
                                      viewModel.addLocation();
                                    }),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
