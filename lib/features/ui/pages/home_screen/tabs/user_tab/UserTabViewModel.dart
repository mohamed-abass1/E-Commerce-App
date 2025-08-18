
import 'package:e_commerece_online_c13/domain/intities/AddLocationResponseEntity.dart';
import 'package:e_commerece_online_c13/domain/repositories/data_source/LocationDataSource.dart';
import 'package:e_commerece_online_c13/domain/use_case/LocationUseCase.dart';
import 'package:e_commerece_online_c13/domain/use_case/RemoveAddressUseCase.dart';
import 'package:e_commerece_online_c13/domain/use_case/UpdateUserDataUseCase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';

import 'UserTabStates.dart';

@injectable
class UserViewModel extends Cubit<UserTabStates> {
  UpdateUserDataUseCase updateUserDataUseCase;
  RemoveAddressUseCase removeAddressUseCase;
  LocationUseCase locationDataSource;
  UserViewModel(
      {required this.removeAddressUseCase,required this.updateUserDataUseCase,required this.locationDataSource})
      :super(UserTabInitialState());
  List<AddLocationDataEntity>userLocations=[];
  AddLocationDataEntity? chosenUserLocation;
  TextEditingController fullNameController =
  TextEditingController(text: "Mohamed Abass Ahmed");
  TextEditingController emailController =
  TextEditingController(text: "em.mohamedabass@gmail.com");
  TextEditingController mobileController =
  TextEditingController(text: "01205408261");
Location location=Location();
 late    GoogleMapController MapController;
LatLng latLng=LatLng(38, -122.08832357078792);
 CameraPosition cameraPosition = CameraPosition(
      target: LatLng(37.43296265331129, -122.08832357078792),
      zoom: 25);
 Set<Marker> marker={
   Marker(markerId: MarkerId('0'))
 };

String? locationMessage;
  static UserViewModel get(context) => BlocProvider.of(context);

  void updateUserInfo() async {
    emit(UserLoadingState());
    var either = await updateUserDataUseCase.invoke(fullNameController.text,emailController.text,mobileController.text);
    either.fold((error) {
      emit(UserErrorState( errorMsg: error.ErrorMsg));
    }, (response) {
      emit(UpdateUserInfoSuccessState(responseEntity: response));
    });
  }

  void removeLocation(String id) async {
    var either = await removeAddressUseCase.invoke(id);
    getUserLocations();
    either.fold((error) {
      emit(UserErrorState( errorMsg: error.ErrorMsg));
    }, (response) {
      emit(RemoveAddressLocationsSuccessState(responseEntity: response));
    });
  }

  void getUserLocations() async {
    var either = await locationDataSource.invoke();
    either.fold((error) {
      emit(UserErrorState( errorMsg: error.ErrorMsg));
    }, (response) {
      userLocations=response.data??[];
      print('num of LOCATIONS ${userLocations.length}');
    emit(GetUserLocationsSuccessState(responseEntity: response));
    });

  }

void changeUserLocation(AddLocationDataEntity? newLocation){
    chosenUserLocation=newLocation;
    print('${newLocation!.id} another ${chosenUserLocation!.id}');
    emit(ChangeChosenLocationSuccessState());
}

  Future<void>getLocation()async {
    bool LocationPermissionGranted=await _GetLocationPermission();
    if (!LocationPermissionGranted){
      return;
    }
    bool locationServiceEnabled=await _locationServiceEnabled();
if(!locationServiceEnabled){
  return;
}
LocationData locationData=await location.getLocation();
onLocationChanged(locationData);
  emit(AddLocationSuccessState());
}

  Future<bool> _GetLocationPermission ()async{
PermissionStatus permissionStatus=await location.hasPermission();
if(permissionStatus == PermissionStatus.denied){
   permissionStatus=await location.requestPermission();
}
return permissionStatus==PermissionStatus.granted;
  }

 Future<bool> _locationServiceEnabled()async {
    bool locationServiceEnabled=await location.serviceEnabled();
    if(!locationServiceEnabled){
      locationServiceEnabled=await location.requestService();
    }
    return locationServiceEnabled;
 }

 void setLocationListener(){
    location.changeSettings(accuracy: LocationAccuracy.high,
    interval: 1000
    );
    location.onLocationChanged.listen((event) {
onLocationChanged(event);
    });
 }

 void onLocationChanged(LocationData locationData){
   marker={Marker(
       markerId: MarkerId('0'),
       position: LatLng(  locationData.latitude??0,
           locationData.longitude??0)
   )};
   cameraPosition=
       CameraPosition(target:
       LatLng(
           locationData.latitude??0,
           locationData.longitude??0
       ),
           zoom: 17);

   MapController.animateCamera(
       CameraUpdate.newCameraPosition(
           cameraPosition
       )
   )
   ;
 }
}

