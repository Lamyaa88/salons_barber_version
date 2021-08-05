import 'package:almezynbarber/network/dio_helper.dart';
import 'package:almezynbarber/network/end_point.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:almezynbarber/app_cubits/rates/rate_states.dart';
import 'package:almezynbarber/app_models/all_rates_model.dart';
class AllRatesCubit extends Cubit<AllRatesStates> {
  AllRatesCubit() : super(AllRatesInitialState());
  static AllRatesCubit get(context) => BlocProvider.of(context);
  AllRatesModel allRatesModel ;
  int statusCode ;
  void getAllRates( String barberId) {
    emit(AllRatesLoadingState());
    DioHelper.getAllData(url: '/get-rate/barber/92' , token: token ).then((value) async {
        print("all data  is ${value.data}") ;
        statusCode = value.statusCode ;
        allRatesModel   = AllRatesModel.fromJson(value.data);


      emit(AllRatesGetSuccessState());
    }).catchError((error) {
      print(error);
      emit(AllRatesGetErrorState(error: error.toString()));
    });
  }
}


