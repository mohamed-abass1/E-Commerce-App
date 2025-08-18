import 'package:auto_size_text/auto_size_text.dart';

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
import '../../../../core/utils/dialog_utils.dart';
import '../../../../core/utils/validators.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../VerifyResetCode/VerifyResetCode_screen.dart';
import 'ForgetPasswordStates.dart';
import 'ForgetPasswordViewModel.dart';

class ForgetPassword extends StatefulWidget {
  static String route='forgetPassword';

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}
class _ForgetPasswordState extends State<ForgetPassword> {
  ForgetPasswordViewModel viewModel=getIt<ForgetPasswordViewModel>();
  Widget build(BuildContext context) {

    return BlocListener<ForgetPasswordViewModel,ForgetPasswordState>(
      bloc:viewModel,
      listener:(context, state) async {
      if (state is ForgetPasswordLoadingState) {
        DialogUtils.showLoading(context: context, message: 'Waiting...');
      } else if (state is ForgetPasswordErrorState) {
        DialogUtils.hideLoading(context);
        DialogUtils.showMessage(
            context: context,
            message: state.errorMsg,
            title: 'Error',
            posActionName: 'Ok');
      } else if (state is SendResetPasswordSuccessState) {
        DialogUtils.hideLoading(context);
        DialogUtils.showMessage(
          context: context,
          message: 'Send Reset Code',
          title: 'Success',
          posActionName: 'Ok',
          posAction: () {Navigator.pushNamed(context, VerifyCode.route);});
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
                        'Forget Password?',
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
                                "Email",
                                style: AppStyles.medium18White,
                              ),
                              CustomTextFormField(
                                  isPassword: false,
                                  keyboardType: TextInputType.text,
                                  isObscureText: false,
                                  hintText: "enter your Email",
                                  hintStyle: AppStyles.light18HintText,
                                  filledColor: AppColors.whiteColor,
                                  controller: viewModel.userNameController,
                                  validator: AppValidators.validateEmail),
                              Padding(
                                padding: EdgeInsets.only(top: 35.h),
                                child: CustomElevatedButton(
                                    backgroundColor: AppColors.whiteColor,
                                    textStyle: AppStyles.semi20Primary,
                                    text: "Sent Reset Code",
                                    onPressed: () {
                                      viewModel.logIn();
                                    }),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(top: 30.h),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pushReplacementNamed(
                                          context, AppRoutes.loginRoute);
                                    },
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Have Account? LogIn',
                                            style: AppStyles.medium18White,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ))
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
