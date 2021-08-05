import 'package:almezynbarber/app_cubits/barber_appointments/appointments_states.dart';
import 'package:almezynbarber/app_cubits/barber_appointments/barber_appointments_cubit.dart';
import 'package:almezynbarber/network/cache_helper.dart';
import 'package:almezynbarber/utils/constants.dart';
import 'package:almezynbarber/utils/file_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:almezynbarber/app_cubits/rates/rate_states.dart';
import 'package:almezynbarber/app_cubits/rates/rate_cubit.dart';

class BarberAppointmentsScreen extends StatefulWidget {
  @override
  _BarberAppointmentsScreenState createState() =>
      _BarberAppointmentsScreenState();
}

class _BarberAppointmentsScreenState extends State<BarberAppointmentsScreen> {
  String userName = "";
  String userNumber = "";
  String userType = "";
  String userId = "";
  String userImage = "";
  String userEmail = "";

  getUserData() async {
    DioHelper.init();
    await CacheHelper.init();
    setState(() {
      userName = CacheHelper.getStringData(key: 'user_name');
      userNumber = CacheHelper.getStringData(key: 'user_phone');
      userEmail = CacheHelper.getStringData(key: 'user_email');
      userType = CacheHelper.getStringData(key: 'user_type');
      userId = CacheHelper.getStringData(key: 'user_id').toString();
      userImage = CacheHelper.getStringData(key: 'user_image');
    });
  }

  @override
  void initState() {
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: NetworkIndicator(
        child: CustomBuildBody(
          isWithoutLogo: true,
          withoutBackIcon: true,
          withoutCartIcon: true,
          headerText: "Appointments",
          paddingPercentageForBody: 0.0,
          columnOfWidgets: Column(
            children: [
              BlocProvider(
                create: (BuildContext context) => BarberAppointmentsCubit()
                  ..getBarberAppointments(userId.toString()),
                child: BlocConsumer<BarberAppointmentsCubit,
                    BarberAppointmentsStates>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    var cubit = BarberAppointmentsCubit.get(context);
                    if (state is! BarberAppointmentsLoadingState) {
                      return Container(
                        height: height,
                        child:  Container(
                          height: height * .8,
                          padding: EdgeInsets.only(
                              right: width * .05, left: width * .05),
                          color: backGroundColor,
                          child: SingleChildScrollView(
                              child: Container(
                                child: Column(
                                  children: [
                                    responsiveSizedBox(
                                        context: context,
                                        percentageOfHeight: .05),
                                    Column(
                                      children: [
                                        Container(width: width*.9,
                                          height: height * .7,
                                          child: ListView.builder(
                                              itemCount: cubit.barberAppointmentsMap.length
//                                            cubit
//                                                .barberAppointmentsModel
//                                                .data
//                                                .length, ,
                                              ,
                                              itemBuilder: (context, index) =>
                                                  Column(
                                                    children: [
                                                      responsiveSizedBox(context: context , percentageOfHeight: .02),
                                                      Neumorphic(
                                                        style:  NeumorphicStyle(
                                                            shape: NeumorphicShape.flat,
                                                            depth: 5,
                                                            lightSource: LightSource.bottomLeft,
                                                            shadowLightColor: Colors.black ,
//                        shadowDarkColor: Colors.grey ,
                                                            color: backGroundColor),

                                                        child: Container(
                                                          child: Row(
                                                            children: [
                                                              Container(width: width*.2,
                                                                child: Image.network(
                                                                    "${baseImageUrl}"
                                                                        "${cubit.barberAppointmentsMap["data"][index]
                                                                    ["applicant"]["image"].toString()}"),
                                                              ),
                                                              SizedBox(width: 15),
                                                              Column(
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                                children: [
                                                                  Row(
                                                                    children: [

                                                                      customDescriptionTextText(
                                                                          context:
                                                                          context,
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                          textColor:
                                                                          blackColor,
                                                                          textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                          text: "Client name : "),
                                                                      customDescriptionTextText(
                                                                          context:
                                                                          context,

                                                                          textColor:
                                                                          blackColor,
                                                                          textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                          text: "${cubit.barberAppointmentsMap["data"][index]["applicant"]["name"].toString()}"),


                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    children: [

                                                                      customDescriptionTextText(
                                                                          context:
                                                                          context,
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                          textColor:
                                                                          blackColor,
                                                                          textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                          text: "day : "),
                                                                      customDescriptionTextText(
                                                                          context:
                                                                          context,

                                                                          textColor:
                                                                          blackColor,
                                                                          textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                          text: "${cubit.barberAppointmentsMap["data"][index]["day"].toString()}"),


                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    children: [

                                                                      customDescriptionTextText(
                                                                          context:
                                                                          context,
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                          textColor:
                                                                          blackColor,
                                                                          textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                          text: "date  : "),
                                                                      customDescriptionTextText(
                                                                          context:
                                                                          context,

                                                                          textColor:
                                                                          blackColor,
                                                                          textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                          text: "${cubit.barberAppointmentsMap["data"][index]
                                                                          ["appointment_date"].toString()}"),


                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    children: [

                                                                      customDescriptionTextText(
                                                                          context:
                                                                          context,
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                          textColor:
                                                                          blackColor,
                                                                          textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                          text: "time  : "),
                                                                      customDescriptionTextText(
                                                                          context:
                                                                          context,

                                                                          textColor:
                                                                          blackColor,
                                                                          textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                          text: "${cubit.barberAppointmentsMap["data"][index]
                                                                          ["appointment_time"].toString()}"),


                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    children: [

                                                                      customDescriptionTextText(
                                                                          context:
                                                                          context,
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                          textColor:
                                                                          blackColor,
                                                                          textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                          text: "location : "),
                                                                      Container(width: width*.3,
                                                                        child: customDescriptionTextText(
                                                                            context:
                                                                            context,

                                                                            textColor:
                                                                            blackColor,
                                                                            textAlign:
                                                                            TextAlign
                                                                                .start,
                                                                            text:  cubit.barberAppointmentsMap["data"][index]
                                                                            ["address"].toString() == "" ? "in salon" :
                                                                            "${cubit.barberAppointmentsMap["data"][index]
                                                                            ["address"]}" , maxLines: 3),
                                                                      )

                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    children: [

                                                                      customDescriptionTextText(
                                                                          context:
                                                                          context,
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                          textColor:
                                                                          blackColor,
                                                                          textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                          text: "description : "),
                                                                      Container(width: width*.3,
                                                                        child: customDescriptionTextText(
                                                                            context:
                                                                            context,

                                                                            textColor:
                                                                            blackColor,
                                                                            textAlign:
                                                                            TextAlign
                                                                                .start,
                                                                            text: "${cubit.barberAppointmentsMap["data"][index]
                                                                            ["description"].toString()}" , maxLines: 3),
                                                                      )

                                                                    ],
                                                                  ),
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )),
                        ),
                      );
                    }
                    return spinKit;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
