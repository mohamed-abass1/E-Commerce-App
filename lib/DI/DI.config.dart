// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../core/api/api_manger.dart' as _i993;
import '../data/data_source/AddFavouriteDataSource.dart';
import '../data/data_source/AddLocationDataSource.dart' as _i295;
import '../data/data_source/AddToCartDataSource.dart' as _i280;
import '../data/data_source/CartDataSource.dart';
import '../data/data_source/ChangePasswordDataSource.dart';
import '../data/data_source/FavouriteDataSource.dart';
import '../data/data_source/GetSpecificProductDataSource.dart';
import '../data/data_source/LocationDataSource.dart' as _i395;
import '../data/data_source/ProductDataSource.dart';
import '../data/data_source/RemoveAddressDataSource.dart' as _i232;
import '../data/data_source/RemoveFavouriteDataSource.dart';
import '../data/data_source/ResetForgottenPasswordDataSource.dart';
import '../data/data_source/SendResetCodeDataSource.dart';
import '../data/data_source/UpdateUserDataSource.dart';
import '../data/data_source/VerifyCodeDataSource.dart' as _i792;
import '../data/data_source/brandDataSource.dart';
import '../data/data_source/categoryDataSource.dart';
import '../data/data_source/logInDataSource.dart';
import '../data/data_source/remote_data_source.dart';
import '../data/repositories/AddFavouriteRepo.dart' as _i105;
import '../data/repositories/AddLocationRepositories.dart' as _i258;
import '../data/repositories/AddToCartRepositories.dart' as _i161;
import '../data/repositories/brandRepository.dart' as _i580;
import '../data/repositories/CartRepositories.dart' as _i59;
import '../data/repositories/categoryRepositories.dart' as _i750;
import '../data/repositories/ChangePasswordRepositories.dart' as _i1028;
import '../data/repositories/FavouriteRepo.dart' as _i151;
import '../data/repositories/GetSpecificProductRepositories.dart' as _i866;
import '../data/repositories/LocationRepository.dart' as _i307;
import '../data/repositories/logInRepositories.dart' as _i832;
import '../data/repositories/ProductRepository.dart' as _i796;
import '../data/repositories/Register_Repositoriesimpl.dart' as _i628;
import '../data/repositories/RemoveAddressRepo.dart' as _i1067;
import '../data/repositories/RemoveFavouriteRepo.dart' as _i124;
import '../data/repositories/ResetForgottenPasswordRepositories.dart' as _i740;
import '../data/repositories/SendResetePasswordRepositories.dart' as _i593;
import '../data/repositories/UpdateUserRepositories.dart' as _i432;
import '../data/repositories/VerifyCodeRepositories.dart' as _i180;
import '../domain/repositories/data_source/AddFavouriteDataSource.dart'
    as _i876;
import '../domain/repositories/data_source/AddLocationDataSource.dart' as _i725;
import '../domain/repositories/data_source/addToCartDataSource.dart' as _i226;
import '../domain/repositories/data_source/brandDataSource.dart' as _i32;
import '../domain/repositories/data_source/CartDataSource.dart' as _i327;
import '../domain/repositories/data_source/categoryDataSource.dart' as _i901;
import '../domain/repositories/data_source/ChangePasswordDataSource.dart'
    as _i465;
import '../domain/repositories/data_source/FavouriteDataSource.dart' as _i776;
import '../domain/repositories/data_source/GetSpecificProductDataSource.dart'
    as _i560;
import '../domain/repositories/data_source/LocationDataSource.dart' as _i23;
import '../domain/repositories/data_source/logInDataSource.dart' as _i451;
import '../domain/repositories/data_source/ProductDataSource.dart' as _i576;
import '../domain/repositories/data_source/remoteDataSource.dart' as _i289;
import '../domain/repositories/data_source/RemoveAddressDataSource.dart'
    as _i74;
import '../domain/repositories/data_source/RemoveFavouriteDataSource.dart'
    as _i404;
import '../domain/repositories/data_source/ResetForgottenPasswordDataSource.dart'
    as _i768;
import '../domain/repositories/data_source/SendResetPasswordDataSource.dart'
    as _i366;
import '../domain/repositories/data_source/UpdateUserDataSource.dart' as _i1046;
import '../domain/repositories/data_source/VerifyCodeDataSource.dart' as _i37;
import '../domain/repositories/repositories/AddFavouriteRepository.dart'
    as _i942;
import '../domain/repositories/repositories/AddLocationRepositories.dart'
    as _i781;
import '../domain/repositories/repositories/addToCartRepositories.dart'
    as _i522;
import '../domain/repositories/repositories/brandRepository.dart' as _i53;
import '../domain/repositories/repositories/CartRepositories.dart' as _i174;
import '../domain/repositories/repositories/categoryRepositories.dart' as _i273;
import '../domain/repositories/repositories/ChangePasswordRepositories.dart'
    as _i76;
import '../domain/repositories/repositories/FavouriteRepository.dart' as _i369;
import '../domain/repositories/repositories/GetSpecificProductRepositories.dart'
    as _i615;
import '../domain/repositories/repositories/LocationRepository.dart' as _i175;
import '../domain/repositories/repositories/logInRepositories.dart' as _i436;
import '../domain/repositories/repositories/ProductRepository.dart' as _i954;
import '../domain/repositories/repositories/RemoveAddressRepository.dart'
    as _i502;
import '../domain/repositories/repositories/RemoveFavouriteRepository.dart'
    as _i217;
import '../domain/repositories/repositories/Repositories.dart' as _i465;
import '../domain/repositories/repositories/ResetForgottenPasswordRepositories.dart'
    as _i499;
import '../domain/repositories/repositories/SendResetPasswordRepositories.dart'
    as _i762;
import '../domain/repositories/repositories/UpdateUserDataRepositories.dart'
    as _i637;
import '../domain/repositories/repositories/VerifyCodeRepositories.dart'
    as _i855;
import '../domain/use_case/AddFavouriteUseCase.dart' as _i551;
import '../domain/use_case/AddLocationUseCase.dart' as _i443;
import '../domain/use_case/addToCartUseCase.dart' as _i577;
import '../domain/use_case/brandUseCase.dart' as _i303;
import '../domain/use_case/CartUseCase.dart' as _i707;
import '../domain/use_case/categoryUseCase.dart' as _i995;
import '../domain/use_case/ChangePasswordUseCase.dart' as _i512;
import '../domain/use_case/DeleteFromCartUseCase.dart' as _i294;
import '../domain/use_case/FavouriteUseCase.dart' as _i661;
import '../domain/use_case/GetSpecificProductUseCase.dart' as _i262;
import '../domain/use_case/LocationUseCase.dart' as _i174;
import '../domain/use_case/logInUseCase.dart' as _i211;
import '../domain/use_case/ProductUseCase.dart' as _i104;
import '../domain/use_case/RegisterUseCase.dart' as _i734;
import '../domain/use_case/RemoveAddressUseCase.dart' as _i684;
import '../domain/use_case/RemoveFavouriteUseCase.dart' as _i1005;
import '../domain/use_case/ResetForgottenPasswordUseCase.dart' as _i135;
import '../domain/use_case/SendResetPasswordUseCase.dart' as _i837;
import '../domain/use_case/UpdateCountInCartUseCase.dart' as _i375;
import '../domain/use_case/UpdateUserDataUseCase.dart' as _i974;
import '../domain/use_case/VerifyCodeUseCase.dart' as _i346;
import '../features/ui/auth/ChangePassword/changePasswordViewModel.dart'
    as _i84;
import '../features/ui/auth/ForgetPassword/ForgetPasswordViewModel.dart'
    as _i448;
import '../features/ui/auth/login/logInViewModel.dart' as _i475;
import '../features/ui/auth/register/view_model.dart' as _i966;
import '../features/ui/auth/ResetedForgetPassword/ResetForgottenPasswordViewModel.dart'
    as _i758;
import '../features/ui/auth/VerifyResetCode/VerifyCodeViewModel.dart' as _i457;
import '../features/ui/GetProductFromCart/GetSpecificProductViewModel.dart'
    as _i432;
import '../features/ui/pages/cart_screen/cartTabViewModel.dart' as _i786;
import '../features/ui/pages/home_screen/tabs/favorite_tab/FavouriteTabViewModel.dart'
    as _i956;
import '../features/ui/pages/home_screen/tabs/home_tab/homeTabViewModel.dart'
    as _i1;
import '../features/ui/pages/home_screen/tabs/products_tab/ProductTabViewModel.dart'
    as _i409;
import '../features/ui/pages/home_screen/tabs/user_tab/AddLocation/AddLocation/AddLocationViewModel.dart'
    as _i1036;
import '../features/ui/pages/home_screen/tabs/user_tab/UserTabViewModel.dart'
    as _i16;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i993.ApiManger>(() => _i993.ApiManger());
    gh.factory<_i901.CategoryDataSource>(
        () => CategoryDataSourceImpl(apiManger: gh<_i993.ApiManger>()));
    gh.factory<_i768.ResetForgottenPasswordDataSource>(() =>
        ResetForgottenPasswordDataSourceImpl(apiManger: gh<_i993.ApiManger>()));
    gh.factory<_i32.BrandDataSource>(
        () => BrandDataSourceImpl(apiManger: gh<_i993.ApiManger>()));
    gh.factory<_i74.RemoveAddressDataSource>(() =>
        _i232.RemoveAddressDataSourceImpl(apiManger: gh<_i993.ApiManger>()));
    gh.factory<_i451.LogInDataSource>(
        () => LogInDataSourceImpl(apiManger: gh<_i993.ApiManger>()));
    gh.factory<_i776.FavouriteDataSource>(
        () => FavouriteDataSourceImpl(apiManger: gh<_i993.ApiManger>()));
    gh.factory<_i404.RemoveFavouriteDataSource>(
        () => RemoveFavouriteDataSourceImpl(apiManger: gh<_i993.ApiManger>()));
    gh.factory<_i725.AddLocationDataSource>(() =>
        _i295.AddLocationDataSourceImpl(apiManger: gh<_i993.ApiManger>()));
    gh.factory<_i576.ProductDataSource>(
        () => ProductDataSourceImpl(apiManger: gh<_i993.ApiManger>()));
    gh.factory<_i327.CartRemoteDataSource>(
        () => CartRemoteDataSourceImpl(apiManager: gh<_i993.ApiManger>()));
    gh.factory<_i174.CartRepository>(() => _i59.CartRepositoryImpl(
        cartRemoteDataSource: gh<_i327.CartRemoteDataSource>()));
    gh.factory<_i366.SendResetPasswordDataSource>(() =>
        SendResetPasswordDataSourceImpl(apiManger: gh<_i993.ApiManger>()));
    gh.factory<_i23.LocationDataSource>(
        () => _i395.LocationDataSourceImpl(apiManger: gh<_i993.ApiManger>()));
    gh.factory<_i560.GetSpecificProductDataSource>(() =>
        GetSpecificProductDataSourceImpl(apiManger: gh<_i993.ApiManger>()));
    gh.factory<_i226.AddToCartDataSource>(
        () => _i280.AddToCartDataSourceImpl(apiManger: gh<_i993.ApiManger>()));
    gh.factory<_i465.ChangePasswordDataSource>(
        () => ChangePasswordDataSourceImpl(apiManger: gh<_i993.ApiManger>()));
    gh.factory<_i289.AuthDataSource>(
        () => AuthDataSourceImpl(apiManger: gh<_i993.ApiManger>()));
    gh.factory<_i1046.UpdateUserDataSource>(
        () => UpdateUserDataSourceImpl(apiManger: gh<_i993.ApiManger>()));
    gh.factory<_i876.AddFavouriteDataSource>(
        () => AddFavouriteDataSourceImpl(apiManger: gh<_i993.ApiManger>()));
    gh.factory<_i37.VerifyCodeDataSource>(
        () => _i792.VerifyCodeDataSourceImpl(apiManger: gh<_i993.ApiManger>()));
    gh.factory<_i273.CategoryRepositories>(() => _i750.CategoryRepositoryImpl(
        categoryDataSource: gh<_i901.CategoryDataSource>()));
    gh.factory<_i499.ResetForgottenPasswordRepositories>(() =>
        _i740.ResetForgottenPasswordRepositoriesImpl(
            logInDataSource: gh<_i768.ResetForgottenPasswordDataSource>()));
    gh.factory<_i217.RemoveFavouriteRepository>(() =>
        _i124.RemoveFavouriteRepositoryImpl(
            favouriteDataSource: gh<_i404.RemoveFavouriteDataSource>()));
    gh.factory<_i954.ProductRepository>(() => _i796.ProductRepositoryImpl(
        productDataSource: gh<_i576.ProductDataSource>()));
    gh.factory<_i175.LocationRepository>(() => _i307.LocationRepositoryImpl(
        brandDataSource: gh<_i23.LocationDataSource>()));
    gh.factory<_i369.FavouriteRepository>(() => _i151.FavouriteRepositoryImpl(
        favouriteDataSource: gh<_i776.FavouriteDataSource>()));
    gh.factory<_i615.GetSpecificProductRepository>(() =>
        _i866.GetSpecificProductRepositoryImpl(
            categoryDataSource: gh<_i560.GetSpecificProductDataSource>()));
    gh.factory<_i855.VerifyCodeRepositories>(() =>
        _i180.VerifyCodeRepositoriesImpl(
            verifyCode: gh<_i37.VerifyCodeDataSource>()));
    gh.factory<_i502.RemoveAddressRepository>(() =>
        _i1067.RemoveAddressRepositoryImpl(
            AddressDataSource: gh<_i74.RemoveAddressDataSource>()));
    gh.factory<_i262.GetSpecificProductUseCase>(() =>
        _i262.GetSpecificProductUseCase(
            getSpecificProductRepository:
                gh<_i615.GetSpecificProductRepository>()));
    gh.factory<_i781.AddLocationRepositories>(() =>
        _i258.AddLocationRepositoriesImpl(
            addLocationDataSource: gh<_i725.AddLocationDataSource>()));
    gh.factory<_i465.AuthRepositories>(() => _i628.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i289.AuthDataSource>()));
    gh.factory<_i174.LocationUseCase>(() =>
        _i174.LocationUseCase(brandRepository: gh<_i175.LocationRepository>()));
    gh.factory<_i432.GetSpecificProductViewModel>(() =>
        _i432.GetSpecificProductViewModel(
            getSpecificProductUseCase: gh<_i262.GetSpecificProductUseCase>()));
    gh.factory<_i1005.RemoveFavouriteUseCase>(() =>
        _i1005.RemoveFavouriteUseCase(
            favouriteRepositories: gh<_i217.RemoveFavouriteRepository>()));
    gh.factory<_i637.UpdateUserDataRepositories>(() =>
        _i432.UpdateUserDataRepositoriesImpl(
            logInDataSource: gh<_i1046.UpdateUserDataSource>()));
    gh.factory<_i135.ResetForgottenPasswordUseCase>(() =>
        _i135.ResetForgottenPasswordUseCase(
            resetForgottenPasswordRepositories:
                gh<_i499.ResetForgottenPasswordRepositories>()));
    gh.factory<_i53.BrandRepository>(() =>
        _i580.BrandRepositoryImpl(brandDataSource: gh<_i32.BrandDataSource>()));
    gh.factory<_i436.LogInRepositories>(() => _i832.LogInRepositoriesImpl(
        logInDataSource: gh<_i451.LogInDataSource>()));
    gh.factory<_i707.GetItemsInCartUseCase>(() => _i707.GetItemsInCartUseCase(
        cartRepository: gh<_i174.CartRepository>()));
    gh.factory<_i294.DeleteItemsInCartUseCase>(() =>
        _i294.DeleteItemsInCartUseCase(
            cartRepository: gh<_i174.CartRepository>()));
    gh.factory<_i375.UpdateCountInCartUseCase>(() =>
        _i375.UpdateCountInCartUseCase(
            cartRepository: gh<_i174.CartRepository>()));
    gh.factory<_i76.ChangePasswordRepositories>(() =>
        _i1028.ChangePasswordRepositoriesImpl(
            changePasswordDataSource: gh<_i465.ChangePasswordDataSource>()));
    gh.factory<_i211.LogInUseCase>(() =>
        _i211.LogInUseCase(logInRepositories: gh<_i436.LogInRepositories>()));
    gh.factory<_i522.AddToCartRepositories>(() =>
        _i161.AddToCartRepositoriesImpl(
            addToCartDataSource: gh<_i226.AddToCartDataSource>()));
    gh.factory<_i684.RemoveAddressUseCase>(() => _i684.RemoveAddressUseCase(
        AddressRepositories: gh<_i502.RemoveAddressRepository>()));
    gh.factory<_i762.SendResetPasswordRepositories>(() =>
        _i593.SendResetPasswordRepositoriesImpl(
            sendResetPasswordDataSource:
                gh<_i366.SendResetPasswordDataSource>()));
    gh.factory<_i734.RegisterUseCase>(() =>
        _i734.RegisterUseCase(authRepositories: gh<_i465.AuthRepositories>()));
    gh.factory<_i475.LogInViewModel>(
        () => _i475.LogInViewModel(logInUseCase: gh<_i211.LogInUseCase>()));
    gh.factory<_i942.AddFavouriteRepository>(() =>
        _i105.AddFavouriteRepositoryImpl(
            addfavouriteDataSource: gh<_i876.AddFavouriteDataSource>()));
    gh.factory<_i346.VerifyCodeUseCase>(() => _i346.VerifyCodeUseCase(
        verifyCode: gh<_i855.VerifyCodeRepositories>()));
    gh.factory<_i995.CategoryUseCase>(() => _i995.CategoryUseCase(
        categoryRepositories: gh<_i273.CategoryRepositories>()));
    gh.factory<_i104.ProductUseCase>(() =>
        _i104.ProductUseCase(productRepository: gh<_i954.ProductRepository>()));
    gh.factory<_i966.RegisterScreenViewModel>(() =>
        _i966.RegisterScreenViewModel(
            registerUseCase: gh<_i734.RegisterUseCase>()));
    gh.factory<_i303.BrandyUseCase>(
        () => _i303.BrandyUseCase(brandRepository: gh<_i53.BrandRepository>()));
    gh.factory<_i512.ChangePasswordUseCase>(() => _i512.ChangePasswordUseCase(
        changePasswordRepositories: gh<_i76.ChangePasswordRepositories>()));
    gh.factory<_i661.FavouriteUseCase>(() => _i661.FavouriteUseCase(
        favouriteRepositories: gh<_i369.FavouriteRepository>()));
    gh.factory<_i1.HomeTabViewModel>(() => _i1.HomeTabViewModel(
          categoryUseCase: gh<_i995.CategoryUseCase>(),
          brandyUseCase: gh<_i303.BrandyUseCase>(),
        ));
    gh.factory<_i443.AddLocationUseCase>(() => _i443.AddLocationUseCase(
        addLocationRepositories: gh<_i781.AddLocationRepositories>()));
    gh.factory<_i84.changePasswordViewModel>(() => _i84.changePasswordViewModel(
        changePasswordUseCase: gh<_i512.ChangePasswordUseCase>()));
    gh.factory<_i1036.AddLocationViewModel>(() => _i1036.AddLocationViewModel(
        addLocationUseCase: gh<_i443.AddLocationUseCase>()));
    gh.factory<_i837.SendResetPasswordUseCase>(() =>
        _i837.SendResetPasswordUseCase(
            sendResetCodeRepositories:
                gh<_i762.SendResetPasswordRepositories>()));
    gh.factory<_i786.CartViewModel>(() => _i786.CartViewModel(
          getItemsInCartUseCase: gh<_i707.GetItemsInCartUseCase>(),
          deleteItemsInCartUseCase: gh<_i294.DeleteItemsInCartUseCase>(),
          updateCountInCartUseCase: gh<_i375.UpdateCountInCartUseCase>(),
        ));
    gh.factory<_i974.UpdateUserDataUseCase>(() => _i974.UpdateUserDataUseCase(
        UpdateUserRepositories: gh<_i637.UpdateUserDataRepositories>()));
    gh.factory<_i758.ResetForgottenPasswordViewModel>(() =>
        _i758.ResetForgottenPasswordViewModel(
            sendResetPasswordUseCase:
                gh<_i135.ResetForgottenPasswordUseCase>()));
    gh.factory<_i457.VerifyCodeViewModel>(() =>
        _i457.VerifyCodeViewModel(verifyCode: gh<_i346.VerifyCodeUseCase>()));
    gh.factory<_i577.AddToCartUseCase>(() => _i577.AddToCartUseCase(
        addToCartRepositories: gh<_i522.AddToCartRepositories>()));
    gh.factory<_i551.AddFavouriteUseCase>(() => _i551.AddFavouriteUseCase(
        AddfavouriteRepositories: gh<_i942.AddFavouriteRepository>()));
    gh.factory<_i956.FavouriteViewModel>(() => _i956.FavouriteViewModel(
          removeFavouriteUseCase: gh<_i1005.RemoveFavouriteUseCase>(),
          getAllFavouriteUseCase: gh<_i661.FavouriteUseCase>(),
          addFavouriteUseCase: gh<_i551.AddFavouriteUseCase>(),
        ));
    gh.factory<_i409.ProductViewModel>(() => _i409.ProductViewModel(
          getAllProductsUseCase: gh<_i104.ProductUseCase>(),
          addCartUseCase: gh<_i577.AddToCartUseCase>(),
        ));
    gh.factory<_i16.UserViewModel>(() => _i16.UserViewModel(
          removeAddressUseCase: gh<_i684.RemoveAddressUseCase>(),
          updateUserDataUseCase: gh<_i974.UpdateUserDataUseCase>(),
          locationDataSource: gh<_i174.LocationUseCase>(),
        ));
    gh.factory<_i448.ForgetPasswordViewModel>(() =>
        _i448.ForgetPasswordViewModel(
            sendResetPasswordUseCase: gh<_i837.SendResetPasswordUseCase>()));
    return this;
  }
}
