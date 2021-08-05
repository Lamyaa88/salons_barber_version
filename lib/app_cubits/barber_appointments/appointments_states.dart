abstract class BarberAppointmentsStates {}

class BarberAppointmentsInitialState  extends BarberAppointmentsStates{}
class BarberAppointmentsLoadingState extends BarberAppointmentsStates{}
class BarberAppointmentsGetSuccessState extends BarberAppointmentsStates{}
class BarberAppointmentsGetErrorState extends BarberAppointmentsStates{
  final String error;
  BarberAppointmentsGetErrorState({this.error});
}