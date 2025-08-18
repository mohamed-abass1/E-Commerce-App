
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../widgets/favorite_item.dart';
import 'FavouriteTabStates.dart';
import 'FavouriteTabViewModel.dart';

class FavoriteTab extends StatefulWidget {
  @override
  State<FavoriteTab> createState() => _FavoriteTabState();
}

class _FavoriteTabState extends State<FavoriteTab> {
  //FavouriteViewModel viewModel=getIt<FavouriteViewModel>();

  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteViewModel,FavouriteTabStates>(
      bloc: FavouriteViewModel.get(context)..getAllFavourites(),

      builder:(context, state) {if (state is FavouriteLoadingState ){return Center(child: CircularProgressIndicator());}
      if (state is RemoveFavouriteLoadingState ){return Center(child: CircularProgressIndicator());}
        if(state is FavouriteSuccessState){return
        Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) =>

                    FavoriteItem(
                      product: state.responseEntity.data![index],
                    ),
                itemCount: FavouriteViewModel.get(context).FavouriteList.length,
              ),
            ),
          ],
        );}
        else return Center(child: CircularProgressIndicator());
      }

       );
  }

  OutlineInputBorder _buildCustomBorder() {
    return OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.primaryColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(50.r));
  }
}
