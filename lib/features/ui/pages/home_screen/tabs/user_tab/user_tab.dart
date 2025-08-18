import 'package:auto_size_text/auto_size_text.dart';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../../DI/DI.dart';
import '../../../../../../core/cach/SharedPrefrence.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_routes.dart';
import '../../../../../../core/utils/app_styles.dart';
import '../../../../../../core/utils/dialog_utils.dart';
import '../../../../auth/ChangePassword/ChangePassword_screen.dart';
import '../../../../widgets/custom_elevated_button.dart';
import '../../../../widgets/custom_text_form_field.dart';
import 'AddLocation/AddLocation/AddLocation_screen.dart';
import 'UserTabStates.dart';
import 'UserTabViewModel.dart';

class UserTab extends StatefulWidget {
  const UserTab({super.key});

  @override
  State<UserTab> createState() => _UserTabState();
}

class _UserTabState extends State<UserTab> {
  TextEditingController passwordController =
      TextEditingController(text: "Current Password.");
  TextEditingController addressController =
      TextEditingController(text: "Choose Your Current Location");
  bool fullNameReadOnly = true;
  bool emailReadOnly = true;
  bool passwordReadOnly = true;
  bool mobileReadOnly = true;
  bool addressReadOnly = true;
  UserViewModel viewModel = getIt<UserViewModel>();
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      UserViewModel.get(context).getUserLocations();
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserViewModel, UserTabStates>(
      bloc: viewModel,
      listener: (BuildContext context, UserTabStates state) {
        if (state is UserLoadingState) {
          DialogUtils.showLoading(context: context, message: 'Loading...');
        } else if (state is UserErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context,
              message: state.errorMsg,
              title: 'Error',
              posActionName: 'OK');
        } else if (state is UpdateUserInfoSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            posAction: (){SharedPreferenceUtils.removeData(key: 'token');
              Navigator.pushNamed(context, AppRoutes.loginRoute);
              },
              context: context,
              message: 'Updated Successfully',
              title: 'Success',
              posActionName: 'OK');
        }
      },
      builder: (context, state) {return
        Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  AutoSizeText(
                    "Welcome, Mohamed",
                    style: AppStyles.medium18Header,
                  ),
                  InkWell(
                    child: Icon(Icons.logout),
                    onTap: () {
                      SharedPreferenceUtils.removeData(key: 'token');

                      Navigator.popAndPushNamed(context, AppRoutes.loginRoute);
                    },
                  )
                ],
              ),///update Info
              SizedBox(
                height: 20.h,
              ),
              AutoSizeText(
                "Your full name",
                style: AppStyles.medium18Header,
              ),
              CustomTextFormField(
                isPassword: false,
                readonly: fullNameReadOnly,
                keyboardType: TextInputType.name,
                controller: viewModel.fullNameController,
                borderColor: AppColors.primary30Opacity,
                suffixIcon: IconButton(
                    onPressed: () {
                      fullNameReadOnly = false;
                      setState(() {});
                    },
                    icon: const Icon(Icons.edit)),
                textStyle: AppStyles.medium14PrimaryDark,
              ),
              AutoSizeText(
                "Your E-mail",
                style: AppStyles.medium18Header,
              ),
              CustomTextFormField(
                readonly: emailReadOnly,
                isPassword: false,
                keyboardType: TextInputType.emailAddress,
                controller: viewModel.emailController,
                borderColor: AppColors.primary30Opacity,
                suffixIcon: IconButton(
                    onPressed: () {
                      emailReadOnly = false;
                      setState(() {});
                    },
                    icon: const Icon(Icons.edit)),
                textStyle: AppStyles.medium14PrimaryDark,
              ),
              AutoSizeText(
                "Your mobile number",
                style: AppStyles.medium18Header,
              ),
              CustomTextFormField(
                isPassword: false,
                readonly: mobileReadOnly,
                keyboardType: TextInputType.phone,
                controller: viewModel.mobileController,
                borderColor: AppColors.primary30Opacity,
                suffixIcon: IconButton(
                    onPressed: () {
                      mobileReadOnly = false;
                      setState(() {});
                    },
                    icon: const Icon(Icons.edit)),
                textStyle: AppStyles.medium14PrimaryDark,
              ),
              SizedBox(
                height: 16.h,
              ),
              CustomElevatedButton(
                  text: 'Update Info',
                  onPressed: () => viewModel.updateUserInfo(),
                  backgroundColor: AppColors.primaryColor,
                  textStyle: AppStyles.semi24White),
            ///reset Password
              AutoSizeText(
                "Your password",
                style: AppStyles.medium18Header,
              ),
              CustomTextFormField(
                isObscureText: true,
                readonly: passwordReadOnly,
                isPassword: false,
                controller: passwordController,
                borderColor: AppColors.primary30Opacity,
                textStyle: AppStyles.medium14PrimaryDark,
              ),
              SizedBox(
                height: 16.h,
              ),

              CustomElevatedButton(
                  text: 'Reset Password',
                  onPressed: () => Navigator.pushNamed(context, ChangePassword.route),
                  backgroundColor: AppColors.primaryColor,
                  textStyle: AppStyles.semi24White),

              ///location
              AutoSizeText(
                'Your Location',
                style: AppStyles.medium18Header,
              ),
              CustomTextFormField(
                isPassword: false,
                readonly: addressReadOnly,
                keyboardType: TextInputType.streetAddress,
                controller: addressController,
                borderColor: AppColors.primary30Opacity,
                suffixIcon: IconButton(
                    icon: InkWell(
                        onTap: () =>
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return
                                  BlocConsumer<UserViewModel, UserTabStates>(
                                    listener:(context, state) { if (state is RemoveAddressLocationsSuccessState) {
                                      DialogUtils.showMessage(
                                      context: context,
                                      message: 'Removed Successfully',
                                      title: 'Success',
                                      posActionName: 'OK');
                                    }}

                                ,
                                    builder: (context, state) {
                                      final locations = UserViewModel.get(context).userLocations;

                                      if (state is UserLoadingState) {
                                        return const Center(child: CircularProgressIndicator());
                                      }

                                      if (locations.isEmpty) {
                                        return const Center(child: Text("No locations found"));
                                      }

                                      return ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: locations.length,
                                        itemBuilder: (context, index) {
                                          final location = locations[index];
                                          final isChosen = location.id == UserViewModel.get(context).chosenUserLocation?.id;

                                          return InkWell(
                                            onTap: () { UserViewModel.get(context).changeUserLocation(location);
                                              addressController.text='${location.city}/${location.details}';
                                              },
                                            child: Container(
                                              margin: const EdgeInsets.all(8),
                                              padding: const EdgeInsets.all(12),
                                              decoration: BoxDecoration(
                                                color: isChosen ? AppColors.primaryColor : AppColors.whiteColor,
                                                borderRadius: const BorderRadius.all(Radius.circular(25)),
                                              ),
                                              child: Stack(
                                                children:[ IconButton(
                                                    onPressed: (){
                                                  UserViewModel.get(context).removeLocation(location.id!);},
                                                    icon: Align(alignment: Alignment.topRight,
                                                        child: Icon(Icons.remove_circle,color: AppColors.redColor,)))
                                                  ,Column(
                                                  children: [
                                                    Text("Name: ${location.name}",
                                                        style: isChosen ? AppStyles.medium20White : AppStyles.semi20Primary),
                                                    Text("Phone: ${location.phone}",
                                                        style: isChosen ? AppStyles.medium20White : AppStyles.semi20Primary),
                                                    Text("Details: ${location.details}",
                                                        style: isChosen ? AppStyles.medium20White : AppStyles.semi20Primary),
                                                    Text("City: ${location.city}",
                                                        style: isChosen ? AppStyles.medium20White : AppStyles.semi20Primary),
                                                  ],
                                                )],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  );

                              },)  ,
                        child: Icon(Icons.arrow_upward)), onPressed: () {},),
                textStyle: AppStyles.medium14PrimaryDark,
              ),
              InkWell(onTap: () { viewModel.getLocation();
                Navigator.pushNamed(context, GoogleMapScreen.route);
                },
                  child: Text('See Your Current Location',
                      style: AppStyles.medium14LightPrimary)),
              SizedBox(
                height: 14.h,
              ),

              CustomElevatedButton(
                  text: 'Type A New Location',
                  onPressed: () => Navigator.pushNamed(context, AddLocation.route),
                  backgroundColor: AppColors.primaryColor,
                  textStyle: AppStyles.semi24White),

            ],
          ),
        ),
      );}
    );
  }
}

class GoogleMapScreen extends StatelessWidget {
  static String route = 'googleMap';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: UserViewModel.get(context),
      builder:(context, state) =>  Scaffold(floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(top: 25,left: 25),
          child: FloatingActionButton(
              backgroundColor: AppColors.primaryColor,
              child: Center(child: Icon(Icons.location_searching_outlined,color: AppColors.whiteColor,),),
              onPressed: (){ UserViewModel.get(context)..getLocation();
              }),
        ),
        body: Column(
          children: [
            Expanded(
                child: GoogleMap(onTap: (argument) {
                  UserViewModel.get(context).latLng=argument;
                },
                  mapType: MapType.normal,
                    markers: UserViewModel.get(context).marker,
                    initialCameraPosition:
                        UserViewModel.get(context).cameraPosition,
                onMapCreated:(controller) {
                  UserViewModel.get(context).MapController=controller;
                } ,

                )
            )
          ],
        ),
      ),
    );
  }
}
