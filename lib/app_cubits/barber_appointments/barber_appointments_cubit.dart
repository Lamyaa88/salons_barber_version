import 'package:almezynbarber/app_models/barber_appointments_model.dart';
import 'package:almezynbarber/network/dio_helper.dart';
import 'package:almezynbarber/network/end_point.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'appointments_states.dart';
class BarberAppointmentsCubit extends Cubit<BarberAppointmentsStates> {
  BarberAppointmentsCubit() : super(BarberAppointmentsInitialState());
  static BarberAppointmentsCubit get(context) => BlocProvider.of(context);
  BarberAppointmentsModel barberAppointmentsModel ;
  Map barberAppointmentsMap = {};
  int statusCode ;
  void getBarberAppointments( String barberId) {
    emit(BarberAppointmentsLoadingState());
    DioHelper.getAllData(url: '/barber-appointments' , token: token ).then((value) async {
        print("all barber appointments is ${value.data}") ;
        statusCode = value.statusCode ;
        barberAppointmentsMap = value.data;
        print(barberAppointmentsMap["data"][0]["applicant"]["name"].toString());
        barberAppointmentsModel   = BarberAppointmentsModel.fromJson(value.data);
      emit(BarberAppointmentsGetSuccessState());
    }).catchError((error) {
      print(error);
      emit(BarberAppointmentsGetErrorState(error: error.toString()));
    });
  }
}




