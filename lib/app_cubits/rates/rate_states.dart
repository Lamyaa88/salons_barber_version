abstract class AllRatesStates {}

class AllRatesInitialState  extends AllRatesStates{}

class AllRatesLoadingState extends AllRatesStates{}

class AllRatesGetSuccessState extends AllRatesStates{}

class AllRatesGetErrorState extends AllRatesStates{
  final String error;
  AllRatesGetErrorState({this.error});
}