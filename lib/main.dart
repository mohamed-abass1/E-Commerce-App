import 'package:e_commerece_app/features/ui/pages/home_screen/Home_Screen_ViewModel.dart';
import 'package:e_commerece_app/features/ui/pages/home_screen/tabs/products_tab/products_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'DI/DI.dart';
import 'core/cach/SharedPrefrence.dart';
import 'core/utils/app_routes.dart';
import 'core/utils/app_theme.dart';
import 'core/utils/bloc_observer/my_bloc_observer.dart';
import 'features/ui/auth/ChangePassword/ChangePassword_screen.dart';
import 'features/ui/auth/ForgetPassword/ForgetPassword_screen.dart';
import 'features/ui/auth/ResetedForgetPassword/ResetedForgetPassword_screen.dart';
import 'features/ui/auth/VerifyResetCode/VerifyResetCode_screen.dart';
import 'features/ui/auth/login/login_screen.dart';
import 'features/ui/auth/register/register_screen.dart';
import 'features/ui/pages/cart_screen/cartTabViewModel.dart';
import 'features/ui/pages/cart_screen/cart_screen.dart';
import 'features/ui/pages/home_screen/Search Screen/SearchScreen.dart';
import 'features/ui/pages/home_screen/home_screen.dart';
import 'features/ui/pages/home_screen/tabs/favorite_tab/FavouriteTabViewModel.dart';
import 'features/ui/pages/home_screen/tabs/products_tab/ProductTabViewModel.dart';
import 'features/ui/GetProductFromCart/FromCartProductScreen.dart';
import 'features/ui/pages/home_screen/tabs/user_tab/AddLocation/AddLocation/AddLocation_screen.dart';
import 'features/ui/pages/home_screen/tabs/user_tab/UserTabViewModel.dart';
import 'features/ui/pages/home_screen/tabs/user_tab/user_tab.dart';
import 'features/ui/product_details_screen/product_details_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  await SharedPreferenceUtils.init();
  String routeName;
  var token = SharedPreferenceUtils.getData(key: 'token');
  if (token != null) {
    routeName = AppRoutes.homeRoute;
  } else {
    routeName = AppRoutes.loginRoute;
  }
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeScreenViewModel()),
        BlocProvider(create: (context) => getIt<UserViewModel>()),
        BlocProvider(create: (context) => getIt<FavouriteViewModel>()),
        BlocProvider(create: (context) => getIt<ProductViewModel>()),
        BlocProvider(create: (context) => getIt<CartViewModel>()),
      ],
      child: MyApp(
        routeName: routeName,
      )));
}

class MyApp extends StatelessWidget {
  String routeName;

  MyApp({required this.routeName});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: routeName,
          routes:{
            AddLocation.route: (context) => AddLocation(),
            ChangePassword.route: (context) => ChangePassword(),
            GoogleMapScreen.route: (context) => GoogleMapScreen(),
        ResetForgetPassword.route: (context) => ResetForgetPassword(),
            VerifyCode.route: (context) => VerifyCode(),
            ForgetPassword.route: (context) => ForgetPassword(),
            AppRoutes.loginRoute: (context) => LoginScreen(),
            AppRoutes.registerRoute: (context) => RegisterScreen(),
            AppRoutes.homeRoute: (context) => const HomeScreen(),
            AppRoutes.cartRoute: (context) => CartScreen(),
            AppRoutes.productDetailsRoute: (context) => ProductDetailsScreen(),
            AppRoutes.productRoute: (context) => ProductsTab(),
            SearchScreen.route: (context) => BlocProvider.value(
                value: HomeScreenViewModel.get(context),
                child: SearchScreen(),
              ),



            FromCartProductScreen.route: (context) => FromCartProductScreen(),

          },
          theme: AppTheme.lightTheme,
        );
      },
    );
  }
}