import 'package:almezynbarber/Models/users_models/single_barber_model.dart';
import 'package:almezynbarber/network/dio_helper.dart';
import 'package:almezynbarber/network/end_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:almezynbarber/app_cubits/single_barber_cubit/single_barber_state.dart';
class SingleBarberCubit extends Cubit<SingleBarberStates> {
  SingleBarberCubit() : super(SingleBarberInitialState());
  /// create object from class cubit and using this with Bloc provider
  static SingleBarberCubit get(context) => BlocProvider.of(context);
  SingleBarberModel singleBarberModel ;
  int  statusCode = 404 ;
//  String  barberId  ;
  void getSingleBarber({String id}) {
    emit(SingleBarberLoadingState());
    DioHelper.getAllData(url: '/barber/${id}',token : token ).then((value) async {
       singleBarberModel  = SingleBarberModel.fromJson(value.data) ;
        statusCode = value.statusCode ;
        final response = await value.data;
        final item = response['data'];
        print(value.data);

        print("my data is ${response}") ;
      emit(SingleBarberGetSuccessState());
    }).catchError((error) {
      print(error);
      emit(SingleBarberGetErrorState(error: error.toString()));
    });
  }



}