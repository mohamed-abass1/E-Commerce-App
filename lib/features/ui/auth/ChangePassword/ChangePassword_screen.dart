import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerece_online_c13/core/utils/dialog_utils.dart';
import 'package:e_commerece_online_c13/features/ui/auth/ForgetPassword/ForgetPassword_screen.dart';
import 'package:e_commerece_online_c13/features/ui/auth/login/logInViewModel.dart';
import 'package:e_commerece_online_c13/features/ui/auth/login/logInViewModelStates.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../DI/DI.dart';
import '../../../../core/cach/SharedPrefrence.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/validators.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'changePasswordViewModel.dart';
import 'changePasswordViewModelStates.dart';

class ChangePassword extends StatefulWidget {
  static String route='changePassword';
  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}
class _ChangePasswordState extends State<ChangePassword> {
  changePasswordViewModel viewModel=getIt<changePasswordViewModel>();
  @override
  Widget build(BuildContext context) {

    return BlocListener<changePasswordViewModel,changePasswordStates>(
      bloc:viewModel,
      listener:(context, state) async {
      if (state is changePasswordLoadingState) {
        DialogUtils.showLoading(context: context, message: 'Waiting...');
      } else if (state is changePasswordErrorState) {
        DialogUtils.hideLoading(context);
        DialogUtils.showMessage(
            context: context,
            message: state.errorMsg,
            title: 'Error',
            posActionName: 'Ok');
      } else if (state is changePasswordSuccessState) {
        DialogUtils.hideLoading(context);
        DialogUtils.showMessage(
          context: context,
          message: 'Change Password Successfully',
          title: 'Success',
          posActionName: 'Ok',
          posAction: () {SharedPreferenceUtils.removeData(key: 'token');
            Navigator.of(context).popAndPushNamed(AppRoutes.loginRoute);});
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
                        'Change Password',
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
                                "Old Password",
                                style: AppStyles.medium18White,
                              ),
                              CustomTextFormField(
                                  isPassword: false,
                                  keyboardType: TextInputType.text,
                                  isObscureText: false,
                                  hintText: "enter your Old Password",
                                  hintStyle: AppStyles.light18HintText,
                                  filledColor: AppColors.whiteColor,
                                  controller: viewModel.oldPasswordController,
                                  validator: AppValidators.validatePassword),
                              Text(
                                "New Password",
                                style: AppStyles.medium18White,
                              ),
                              CustomTextFormField(
                                isPassword: true,
                                keyboardType: TextInputType.visiblePassword,
                                isObscureText: true,
                                hintText: "enter your New Password",
                                hintStyle: AppStyles.light18HintText,
                                filledColor: AppColors.whiteColor,
                                controller: viewModel.newPasswordController,
                                validator: AppValidators.validatePassword,
                                suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.visibility_off)),
                              ),
                              Text(
                                "Re Password",
                                style: AppStyles.medium18White,
                              ),
                              CustomTextFormField(
                                isPassword: true,
                                keyboardType: TextInputType.visiblePassword,
                                isObscureText: true,
                                hintText: " Re Password",
                                hintStyle: AppStyles.light18HintText,
                                filledColor: AppColors.whiteColor,
                                controller: viewModel.rePasswordController,
                                validator: AppValidators.validatePassword,
                                suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.visibility_off)),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 35.h),
                                child: CustomElevatedButton(
                                    backgroundColor: AppColors.whiteColor,
                                    textStyle: AppStyles.semi20Primary,
                                    text: "Change Password",
                                    onPressed: () {
                                      viewModel.changePassword();
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
