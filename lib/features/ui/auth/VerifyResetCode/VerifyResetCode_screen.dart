import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerece_online_c13/core/utils/dialog_utils.dart';
import 'package:e_commerece_online_c13/features/ui/auth/ForgetPassword/ForgetPasswordStates.dart';
import 'package:e_commerece_online_c13/features/ui/auth/ForgetPassword/ForgetPasswordViewModel.dart';
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
import '../ResetedForgetPassword/ResetedForgetPassword_screen.dart';
import 'VerifyCodeStates.dart';
import 'VerifyCodeViewModel.dart';

class VerifyCode extends StatefulWidget {
  static String route='Verify';

  @override
  State<VerifyCode> createState() => _VerifyCodeState();
}
class _VerifyCodeState extends State<VerifyCode> {
  VerifyCodeViewModel viewModel=getIt<VerifyCodeViewModel>();
  Widget build(BuildContext context) {

    return BlocListener<VerifyCodeViewModel,VerifyCodeState>(
      bloc:viewModel,
      listener:(context, state) async {
      if (state is VerifyCodeLoadingState) {
        DialogUtils.showLoading(context: context, message: 'Waiting...');
      } else if (state is VerifyCodeErrorState) {
        DialogUtils.hideLoading(context);
        DialogUtils.showMessage(
            context: context,
            message: state.errorMsg,
            title: 'Error',
            posActionName: 'Ok');
      } else if (state is VerifyCodeSuccessState) {
        DialogUtils.hideLoading(context);
        DialogUtils.showMessage(
          context: context,
          message: 'Verified',
          title: 'Success',
          posActionName: 'Ok',
          posAction: () {Navigator.pushNamed(context, ResetForgetPassword.route);});
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
                        'Verify Reset Code',
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
                                "code",
                                style: AppStyles.medium18White,
                              ),
                              CustomTextFormField(
                                  isPassword: false,
                                  keyboardType: TextInputType.text,
                                  isObscureText: false,
                                  hintText: "enter Verify Code",
                                  hintStyle: AppStyles.light18HintText,
                                  filledColor: AppColors.whiteColor,
                                  controller: viewModel.codeController,),
                              Padding(
                                padding: EdgeInsets.only(top: 35.h),
                                child: CustomElevatedButton(
                                    backgroundColor: AppColors.whiteColor,
                                    textStyle: AppStyles.semi20Primary,
                                    text: "Verify Reset Code",
                                    onPressed: () {
                                      viewModel.VerifyCode();
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
