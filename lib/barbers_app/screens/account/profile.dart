
import 'package:almezynbarber/Models/salons_models/single_salon_model.dart';
import 'package:almezynbarber/utils/check_direction.dart';
import 'package:almezynbarber/utils/constants.dart';
import 'package:almezynbarber/utils/file_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:almezynbarber/app_cubits/single_barber_cubit/single_barber_state.dart';
import 'package:almezynbarber/app_cubits/single_barber_cubit/single_barber_cubit.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class ProfileScreen extends StatefulWidget {
  final barberId;
  ProfileScreen({this.barberId});
  @override
  _ProfileScreenState createState() =>
      _ProfileScreenState(barberId);
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  final barberId;
  var selectedItemList ;
  List<String> _checked = ["A", "B"];

  _ProfileScreenState(this.barberId);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: whiteColor,
      child: BlocProvider(
        create: (BuildContext context) => SingleBarberCubit()..getSingleBarber(id: barberId),
        child: BlocConsumer<SingleBarberCubit , SingleBarberStates>(
          listener: (context , state){},
          builder: (context , state){


            var cubit = SingleBarberCubit.get(context);




            if(state is! SingleBarberLoadingState ){
              return  Scaffold(

                body : Container(
                  child: NestedScrollView(
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) {
                      return <Widget>[
                        SliverAppBar(
                          automaticallyImplyLeading: false,
                          leading: null,
                          expandedHeight: isLandscape(context)
                              ? 2 * height * .3
                              : height * .3,
                          backgroundColor: whiteColor,
                          floating: false,
                          pinned: false,
                          flexibleSpace: FlexibleSpaceBar(
                            background:  Container(height: isLandscape(context) ?  2*height*.3 :height*.3,width: width,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:
                                  NetworkImage(
                                      "v" ) ,
                                  fit: isLandscape(context) ?  BoxFit.fitHeight :  BoxFit.cover,
                                ),
                              ),),),
                        ),
                      ];
                    },
                    body:   SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(padding: EdgeInsets.only(right: width*.05 , left: width*.05 ),height: height*.88,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  responsiveSizedBox(context: context, percentageOfHeight: .03) ,
                                  Row(
                                    children: [
                                      customDescriptionTextText(
                                          context:
                                          context,
                                          text:
                                          checkDirection(cubit.singleBarberModel.data.name, cubit.singleBarberModel.data.name) ,
                                          maxLines:
                                          10,
                                          textAlign:
                                          TextAlign
                                              .start,
                                          percentageOfHeight:
                                          .03,
                                          fontWeight:
                                          FontWeight
                                              .bold,
                                          textColor:
                                          Colors
                                              .black),
                                    ],
                                  ),
                                  responsiveSizedBox(context: context, percentageOfHeight: .02) ,
                                  Row(
                                    children: [
                                      Container(width: width*.9,child:  customDescriptionTextText(
                                          context:
                                          context,
                                          text:
                                          checkDirection(
                                              cubit.singleBarberModel.data.experience
                                              , cubit.singleBarberModel.data.name) ,
                                          maxLines:
                                          10,
                                          textAlign:
                                          TextAlign
                                              .start,
                                          percentageOfHeight:
                                          .02,

                                          textColor:
                                          Colors
                                              .black),)
                                    ],
                                  ),

                                  responsiveSizedBox(context: context, percentageOfHeight: .03) ,

                                  Row(
                                    children: [
                                      customDescriptionTextText(
                                          context:
                                          context,
                                          text:
                                          translator.translate("Services :"),
                                          maxLines:
                                          10,
                                          textAlign:
                                          TextAlign
                                              .start,
                                          percentageOfHeight:
                                          .03,
                                          fontWeight:
                                          FontWeight
                                              .bold,
                                          textColor:
                                          Colors
                                              .black),
                                    ],
                                  ),
                                  responsiveSizedBox(context: context, percentageOfHeight: .03) ,
                                  Container(height: height*.3,child:
                                  ListView.builder(
//                                              shrinkWrap: true,
                                      physics:
                                      BouncingScrollPhysics(),
                                      scrollDirection:
                                      Axis.vertical,
                                      itemCount: cubit.singleBarberModel.data.services.length,
                                      itemBuilder:
                                          (context, subIndex ) {
                                        return Container(
                                          margin: EdgeInsets.only(bottom:  isLandscape(context)
                                              ? 2 * height * .03
                                              : height * .03),
                                          child: Row(
                                            children: [
                                              Neumorphic(
                                                child: Container(width: width*.88,
                                                  child: Row(
                                                    children: [

                                                      Container(
                                                        decoration: BoxDecoration(
                                                          image: DecorationImage(

                                                            image: NetworkImage(
                                                                "${baseImageUrl}${cubit.singleBarberModel.data.services[subIndex].nameEn}"
                                                            ),
                                                            fit: BoxFit.cover,
                                                          ),
                                                          color: backGroundColor,
                                                          borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  0)),
                                                        ),
                                                        height: isLandscape(context)
                                                            ? 2 * height * .1
                                                            : height * .1,
                                                        width: width * .2,
                                                      ),

                                                      Container(
                                                          child: Container(
                                                            width: width * .68,
                                                            height: isLandscape(
                                                                context)
                                                                ? 2 * height * .1
                                                                : height * .1,
                                                            decoration: BoxDecoration(
                                                                color: whiteColor,
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    0)),
                                                            child: Row(
                                                              children: [
                                                                SizedBox(width: width*.03,),
                                                                Container(
                                                                    child: customDescriptionTextText(
                                                                        textColor: blackColor,
                                                                        fontWeight: FontWeight.bold,
                                                                        context:
                                                                        context,
                                                                        textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                        text:checkDirection(cubit.singleBarberModel.data.services[subIndex].nameEn,cubit.singleBarberModel.data.services[subIndex].nameEn)

                                                                    )),
                                                              ],
                                                            ),)
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }),),
                                  responsiveSizedBox(context: context, percentageOfHeight: .03) ,
                                  Row(
                                    children: [
                                      customDescriptionTextText(
                                          context:
                                          context,
                                          text:
                                          translator.translate("specifications:"),
                                          maxLines:
                                          10,
                                          textAlign:
                                          TextAlign
                                              .start,
                                          percentageOfHeight:
                                          .03,
                                          fontWeight:
                                          FontWeight
                                              .bold,
                                          textColor:
                                          Colors
                                              .black),
                                    ],
                                  ),
                                  responsiveSizedBox(context: context, percentageOfHeight: .03) ,
                                  Container(height: height*.3,child:
                                  ListView.builder(
//                                              shrinkWrap: true,
                                      physics:
                                      BouncingScrollPhysics(),
                                      scrollDirection:
                                      Axis.vertical,
                                      itemCount:cubit.singleBarberModel.data.specifications.length ,
                                      itemBuilder:
                                          (context, subIndex ) {
                                        return Container(
                                          margin: EdgeInsets.only(bottom:  isLandscape(context)
                                              ? 2 * height * .03
                                              : height * .03),
                                          child: Row(
                                            children: [
                                              Neumorphic(
                                                child: Container(width: width*.88,
                                                  child: Row(
                                                    children: [

                                                      Container(
                                                        decoration: BoxDecoration(
                                                          image: DecorationImage(

                                                            image: NetworkImage(
                                                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgEgHDEN5B3hKCumhRcXiRZ2tbBECGffJMYw&usqp=CAU"
                                                            ),
                                                            fit: BoxFit.cover,
                                                          ),
                                                          color: backGroundColor,
                                                          borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  0)),
                                                        ),
                                                        height: isLandscape(context)
                                                            ? 2 * height * .1
                                                            : height * .1,
                                                        width: width * .2,
                                                      ),

                                                      Container(
                                                          child: Container(
                                                            width: width * .68,
                                                            height: isLandscape(
                                                                context)
                                                                ? 2 * height * .1
                                                                : height * .1,
                                                            decoration: BoxDecoration(
                                                                color: whiteColor,
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    0)),
                                                            child: Row(
                                                              children: [
                                                                SizedBox(width: width*.03,),
                                                                Container(
                                                                    child: customDescriptionTextText(
                                                                        textColor: blackColor,
                                                                        fontWeight: FontWeight.bold,
                                                                        context:
                                                                        context,
                                                                        textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                        text:checkDirection(cubit.singleBarberModel.data.specifications[subIndex].nameEn ,cubit.singleBarberModel.data.specifications[subIndex].nameEn)

                                                                    )),
                                                              ],
                                                            ),)
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }),),
//                                  responsiveSizedBox(context: context, percentageOfHeight: .03) ,
//                                  Row(
//                                    children: [
//                                      customDescriptionTextText(
//                                          context:
//                                          context,
//                                          text:
//                                          translator.translate("Works on :"),
//                                          maxLines:
//                                          10,
//                                          textAlign:
//                                          TextAlign
//                                              .start,
//                                          percentageOfHeight:
//                                          .03,
//                                          fontWeight:
//                                          FontWeight
//                                              .bold,
//                                          textColor:
//                                          Colors
//                                              .black),
//                                    ],
//                                  ),
//                                  responsiveSizedBox(context: context, percentageOfHeight: .03) ,

//                                  Container(height: height*.3,child:
//                                  ListView.builder(
////                                              shrinkWrap: true,
//                                      physics:
//                                      BouncingScrollPhysics(),
//                                      scrollDirection:
//                                      Axis.vertical,
//                                      itemCount: 5,
//                                      itemBuilder:
//                                          (context, subIndex ) {
//                                        return Container(
//                                          margin: EdgeInsets.only(bottom:  isLandscape(context)
//                                              ? 2 * height * .03
//                                              : height * .03),
//                                          child: Row(
//                                            children: [
//                                              Neumorphic(
//                                                child: Container(width: width*.88,
//                                                  child: Row(
//                                                    children: [
//
//                                                      Container(
//                                                        decoration: BoxDecoration(
//                                                          image: DecorationImage(
//
//                                                            image: NetworkImage(
//                                                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgEgHDEN5B3hKCumhRcXiRZ2tbBECGffJMYw&usqp=CAU"
//                                                            ),
//                                                            fit: BoxFit.cover,
//                                                          ),
//                                                          color: backGroundColor,
//                                                          borderRadius:
//                                                          BorderRadius.all(
//                                                              Radius.circular(
//                                                                  0)),
//                                                        ),
//                                                        height: isLandscape(context)
//                                                            ? 2 * height * .1
//                                                            : height * .1,
//                                                        width: width * .2,
//                                                      ),
//
//                                                      Container(
//                                                          child: Container(
//                                                            width: width * .68,
//                                                            height: isLandscape(
//                                                                context)
//                                                                ? 2 * height * .1
//                                                                : height * .1,
//                                                            decoration: BoxDecoration(
//                                                                color: whiteColor,
//                                                                borderRadius:
//                                                                BorderRadius
//                                                                    .circular(
//                                                                    0)),
//                                                            child: Row(
//                                                              children: [
//                                                                SizedBox(width: width*.03,),
//                                                                Container(
//                                                                    child: customDescriptionTextText(
//                                                                        textColor: blackColor,
//                                                                        fontWeight: FontWeight.bold,
//                                                                        context:
//                                                                        context,
//                                                                        textAlign:
//                                                                        TextAlign
//                                                                            .start,
//                                                                        text:checkDirection("???? ??????????", "King Salon ")
//
//                                                                    )),
//                                                              ],
//                                                            ),)
//                                                      ),
//                                                    ],
//                                                  ),
//                                                ),
//                                              ),
//                                            ],
//                                          ),
//                                        );
//                                      }),),
                                  responsiveSizedBox(context: context, percentageOfHeight: .02) ,
                                  Row(
                                    children: [
                                      customDescriptionTextText(
                                          context:
                                          context,
                                          text:
                                          translator.translate("Reviews:"),
                                          maxLines:
                                          10,
                                          textAlign:
                                          TextAlign
                                              .start,
                                          percentageOfHeight:
                                          .03,
                                          fontWeight:
                                          FontWeight
                                              .bold,
                                          textColor:
                                          Colors
                                              .black),
                                    ],
                                  ),
                                  responsiveSizedBox(context: context, percentageOfHeight: .02) ,
                                  Container(height: height*.3,child:
                                  ListView.builder(
//                                              shrinkWrap: true,
                                      physics:
                                      BouncingScrollPhysics(),
                                      scrollDirection:
                                      Axis.vertical,
                                      itemCount: 5,
                                      itemBuilder:
                                          (context, subIndex ) {
                                        return Container(
                                          margin: EdgeInsets.only(bottom:  isLandscape(context)
                                              ? 2 * height * .03
                                              : height * .03),
                                          child: Row(
                                            children: [
                                              Container(
                                                child: Container(width: width*.88,
                                                  child: Row(
                                                    children: [

                                                      Column(mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Container(
                                                            decoration: BoxDecoration(
                                                              shape: BoxShape.circle,
                                                              image: DecorationImage(


                                                                image: NetworkImage(

                                                                    "https://st2.depositphotos.com/1011434/5480/i/950/depositphotos_54809905-stock-photo-smiling-guy.jpg"
                                                                ),
                                                                fit: BoxFit.cover,
                                                              ),
                                                              color: backGroundColor,


                                                            ),
                                                            height: isLandscape(context)
                                                                ? 2 * height * .08
                                                                : height * .08,
                                                            width: width * .15,
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(width: width*.02,),
                                                      Column(mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Container(
                                                              child: Container(
                                                                width: width * .68,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                    BorderRadius
                                                                        .circular(0)),
                                                                child: Column(
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [

                                                                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                      children: [

                                                                        Container(width: width*.4,
                                                                            child: customDescriptionTextText(
                                                                                context:
                                                                                context,
                                                                                fontWeight: FontWeight.bold,
                                                                                textColor: blackColor,
                                                                                textAlign:
                                                                                TextAlign
                                                                                    .start,
                                                                                text:checkDirection("?????? ????????", "Ali Amr")

                                                                            )),
                                                                        Row(
                                                                          children: [
                                                                            Container(
                                                                                child: Icon(Icons.star , color: yellowColor,size:isLandscape(
                                                                                    context)
                                                                                    ? 2 * height * .02
                                                                                    : height * .02,

                                                                                )),
                                                                            customDescriptionTextText(
                                                                                context:
                                                                                context,
                                                                                textColor: blueColor ,
                                                                                fontWeight: FontWeight.bold,
                                                                                textAlign:
                                                                                TextAlign
                                                                                    .start,
                                                                                text:checkDirection("5.0", "5.0"))
                                                                          ],
                                                                        ),

                                                                      ],

                                                                    ),
                                                                    Row(mainAxisAlignment: MainAxisAlignment.start,
                                                                      children: [
                                                                        Container(width: width*.6,
                                                                            child: customDescriptionTextText(
                                                                                context:
                                                                                context,maxLines: 3,
                                                                                textAlign:
                                                                                TextAlign
                                                                                    .start,
                                                                                text:checkDirection("???? ???????? ?????????? ?????????? ???? ???????? ... ???????? ???? ", "He is a good barber , thanks ")

                                                                            )),

                                                                      ],

                                                                    ),
                                                                  ],
                                                                ),)
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }),),
                                  responsiveSizedBox(context: context, percentageOfHeight: .1) ,
                                ],
                              ),
                            ),
                          ),




                          CustomButton(text: "Book Appointment with",
                            onTapButton: (){



//
//                              showCustomAlertDialog(context: context , alertTitle: "Choose Appointment Place" ,
//                                  onTapHome: (){
//
////                                    customPushNamedNavigation(context, PickAppointmentLocationScreen(29.993522348203385, 31.48447766704748));
//
//                                  },onTapSalon: (){
//
//                                  },
//
//                                  alertSubtitle: "Please choose Appointment Place \n wether home or salon");


//                  showBottomSheetMenuForAddingCard(context: context , onTapAddCardButton: (){
//                  Navigator.of(context).pop();
//                  showCustomAlertDialog(alertSubtitle: checkDirection("???? ?????????? ?????????? ?????????? ", "appointment has been sent successfully ! "
//                  ),context: context  , alertTitle: checkDirection("????", "Done !") , onTapOk:
//                      (){Navigator.of(context).pop() ; } ,onTapClose: (){
//                    Navigator.of(context).pop();
//                    customAnimatedPushNavigation(context,
//                        AppointmentsHomeScreen());});
//                });

                            }

                            ,)
                        ],
                      ),
                    ),),
                ),
              ) ;

            }return spinKit ;




          },
        ),
      ),
    );
  }
  void showBottomSheetMenuForAddingCard({BuildContext context , onTapAddCardButton}){
    showModalBottomSheet(
        context: context,
        builder: (builder){
          return new Container(
            height: height(context),
            color: Colors.transparent,
            child: new Container(
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(10.0),
                        topRight: const Radius.circular(10.0))),
                child: new Container(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        responsiveSizedBox(context: context , percentageOfHeight: .02) ,


                        Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            responsiveSizedBox(context: context , percentageOfHeight: .02) ,

                            customDescriptionTextText(context: context , textColor: blackColor ,
                                text: "Book Appointment " , percentageOfHeight: .025, fontWeight: FontWeight.bold),

                          ]
                          ,) ,
                        Container(padding: EdgeInsets.only(right: width(context)*.05 , left: width(context)*.05),
                          child: Column(
                            children: [
                              responsiveSizedBox(context: context , percentageOfHeight: .02) ,
                              Row(children: [
                                customDescriptionTextText(context: context ,
                                    text: "Choose a Place:" , percentageOfHeight: .025, textAlign: TextAlign.start , textColor: blackColor ),

                              ],),
                              Container(child: Row(children: [
                                GestureDetector(onTap: (){}, child: customDescriptionTextText(context: context ,text: "home" ),) ,

                                GestureDetector(onTap: (){}, child: customDescriptionTextText(context: context ,text: "Salon" ),)

                              ],),),
                              responsiveSizedBox(context: context , percentageOfHeight: .02) ,
                              Row(children: [
                                customDescriptionTextText(context: context ,
                                    text: "Choose a day :" , percentageOfHeight: .025, textAlign: TextAlign.start , textColor: blackColor ),

                              ],),
                              RadioButtonGroup(
                                activeColor: blueColor,
                                labels: [
                                  "22-7-2021",
                                  "23-7-2021",
                                  "24-7-2021",
                                  "25-7-2021",

                                ],
//                          disabled: [
//                            "Option 1"
//                          ],
                                onChange: (String label, int index) => print("label: $label index: $index"),
                                onSelected: (String label) => print(label),
                              ),
                              responsiveSizedBox(context: context , percentageOfHeight: .02) ,
                              Row(children: [
                                customDescriptionTextText(context: context ,
                                    text: "Choose a time :" , percentageOfHeight: .025, textAlign: TextAlign.start , textColor: blackColor  ),
                              ],),
                              RadioButtonGroup(
                                activeColor: blueColor,
                                labels: [
                                  "8:00  - 9:00",
                                  "12:00 - 1:00",
                                  "3:00  - 4:00",


                                ],
//                          disabled: [
//                            "Option 1"
//                          ],
                                onChange: (String label, int index) => print("label: $label index: $index"),
                                onSelected: (String label) => print(label),
                              ),

                              responsiveSizedBox(context: context , percentageOfHeight: .02) ,
                              Row(children: [
                                customDescriptionTextText(context: context ,
                                    text: "Choose a speciality :" , percentageOfHeight: .025,  textAlign: TextAlign.start , textColor: blackColor ),
                              ],),

                              responsiveSizedBox(context: context , percentageOfHeight: .02) ,
                              brandCheckBoxFilter(context: context ,onChangeCheckBox: (itemList) {
                                setState(() {selectedItemList = itemList;
                                print('SELECTED ITEM LIST $itemList');});},),

                              responsiveSizedBox(context: context , percentageOfHeight: .02) ,
                              Row(children: [
                                customDescriptionTextText(context: context ,
                                    text: "Description :" , percentageOfHeight: .025, textAlign: TextAlign.start , textColor: blackColor  ),
                              ],)
                            ],
                          ),),


                        responsiveSizedBox(context: context , percentageOfHeight: .02) ,


                        CustomTextField(hint: "appointment for ",
                        ),
                        responsiveSizedBox(context: context , percentageOfHeight: .02) ,

                        responsiveSizedBox(context: context , percentageOfHeight: .02) ,


                        CustomButton(onTapButton: onTapAddCardButton ,text:  "Confirm Booking"),
                        responsiveSizedBox(context: context , percentageOfHeight: .02) ,





                      ],
                    ),
                  ),
                )),
          );
        }
    );
  }

  brandCheckBoxFilter({BuildContext context   , Function onChangeCheckBox }){

    List<String> allItemList = [
      'Hair cut ',
      'Beard shaving ',
      'Baby  Hair cut ',
    ];

    List<String> checkedItemList = ['Green', 'Yellow'];

    return  GroupedCheckbox(
      hoverColor: blueColor,
      itemList: allItemList,
//      checkedItemList: checkedItemList,
//      disabled: ['Black'],
      onChanged:  onChangeCheckBox ,
//          (itemList) {
//        setState(() {
//          selectedItemList = itemList;
//          print('SELECTED ITEM LIST $itemList');
//        });
//      },
      orientation: CheckboxOrientation.VERTICAL,
      checkColor: whiteColor ,
      activeColor: blueColor  ,

    );
  }

  Future showCustomAlertDialog(

      {BuildContext context, String alertTitle ,String alertSubtitle , Function onTapHome , Function onTapSalon }) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            width: isLandscape(context)
                ? .7 * width(context) * .95
                : width(context) * .95,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
//                responsiveSizedBox(context: context, percentageOfHeight: .02),
                Container(
                  height: isLandscape(context)
                      ? 2 * height(context) * .25
                      : height(context) * .25,
                  width: width(context)*.5,
                  decoration:
                  BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/jump.gif"),fit: BoxFit.fill )),
                ),
                responsiveSizedBox(context: context, percentageOfHeight: .0),
                customBoldText(context: context, text: alertTitle ),
                responsiveSizedBox(context: context, percentageOfHeight: .02),
                customDescriptionTextText(context: context, text: alertSubtitle , maxLines: 40),
                responsiveSizedBox(context: context, percentageOfHeight: .02),

              ],
            ),
          ),
          actions: <Widget>[
            Container(
              padding: EdgeInsets.all(
                height(context) * .02,
              ),
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        child:
                        customDescriptionTextText(context: context, text: translator.translate("Home"),
                            textColor: blueColor
                            , percentageOfHeight: .022 , fontWeight: FontWeight.bold ),
                        onTap: onTapHome ),
                    SizedBox(width: width(context)*.05,),
                    GestureDetector(
                        child:
                        customDescriptionTextText(context: context, text: translator.translate("Salon") ,

                            percentageOfHeight: .022, fontWeight: FontWeight.bold  , textColor: blueColor),
                        onTap: onTapSalon )]
              ),
            ),
          ],
        );
      },
    );
  }
}



//---------------------
//Scaffold(
//backgroundColor: whiteColor,
//body: Container(
//child:CustomBuildBody(
//backNotDrawerIcon: true,
//isWithoutLogo: true,
//headerText:"name",
//paddingPercentageForBody: 0.0,
//columnOfWidgets: Column(
//children: [
//Container(
//height: height,
//child: NestedScrollView(
//headerSliverBuilder: (BuildContext context,
//    bool innerBoxIsScrolled) {
//return <Widget>[
//SliverAppBar(
//automaticallyImplyLeading: false,
//leading: null,
//expandedHeight: isLandscape(context)
//? 2 * height * .5
//    : height * .5,
//backgroundColor: whiteColor,
//floating: false,
//pinned: false,
//flexibleSpace: FlexibleSpaceBar(
//background: Container(
//child:
//Column(
//children: [
//Container(
//height: height * .5,
//width: width,
//decoration: BoxDecoration(
//borderRadius:
//BorderRadius
//    .circular(8),
//image: DecorationImage(
//image: NetworkImage(
//"https://assets.entrepreneur.com/content/3x2/2000/20190502194704-ent19-june-editorsnote.jpeg"
//
//),
//fit: BoxFit.cover)))
//],
//),
//)),
//),
//];
//},
//body: Container(
//padding: EdgeInsets.only(
//right: width * .05,
//left: width * .05),
//child: SingleChildScrollView(
//child: Column(
//children: [
//responsiveSizedBox(context: context , percentageOfHeight: .02),
//customDescriptionTextText(context: context,
//text: checkDirection("name",
//"name"), percentageOfHeight:
//.035, textColor: blackColor, textAlign: TextAlign.start, fontWeight: FontWeight.bold),
//responsiveSizedBox(context: context , percentageOfHeight: .02),
//Row(children: [
//customDescriptionTextText(context: context,
//text: "Specifications", percentageOfHeight:
//.028 , textAlign: TextAlign.start ),
//],),
//
//responsiveSizedBox(context: context , percentageOfHeight: .02),
//
//Container(
//width: width * .9,
//child: Row(
//mainAxisAlignment:
//MainAxisAlignment
//    .start,
//children: [
//
//Container(
//width:
//width *
//.9,
//height: isLandscape(
//context)
//? 2 *
//height *
//.1
//: height *
//.1,
//child: ListView.builder(
////                                          shrinkWrap: true,
////                                        physics: BouncingScrollPhysics(),
//scrollDirection: Axis.horizontal,
//itemCount: 10 ,
////                                                    cubit.singleBarberModel.data.specifications.length,
//itemBuilder: (context, indexForServices) {
//return Row(
//children: [
//Container(margin: EdgeInsets.only(left: width*.02),
//width: width*.5,height: height*.08,
//decoration: BoxDecoration(color: backGroundColor , borderRadius:
//BorderRadius.circular(8)),child: Center(child: customDescriptionTextText(context: context,text: "Hair Cut " , percentageOfHeight: .02),),
//
//
//),
//],
//);
//})),
//],
//),
//),
//
//responsiveSizedBox(context: context , percentageOfHeight: .02),
//Row(children: [
//customDescriptionTextText(context: context,
//text: "Services", percentageOfHeight:
//.028 , textAlign: TextAlign.start ),
//],),
//Container(
//width:
//width *
//.9,
//height: isLandscape(
//context)
//? 2 *
//height *
//.1
//: height *
//.1,
//child: ListView.builder(
////                                          shrinkWrap: true,
////                                        physics: BouncingScrollPhysics(),
//scrollDirection: Axis.horizontal,
//itemCount: 10 ,
////                                                    cubit.singleBarberModel.data.specifications.length,
//itemBuilder: (context, indexForServices) {
//return Row(
//children: [
//Container(margin: EdgeInsets.only(left: width*.02),
//width: width*.5,height: height*.08,
//decoration: BoxDecoration(color: backGroundColor , borderRadius:
//BorderRadius.circular(8)),child: Center(child: customDescriptionTextText(context: context,text: "Hair Cut " , percentageOfHeight: .02),),
//
//
//),
//],
//);
//})),
//responsiveSizedBox(context: context , percentageOfHeight: .02),
//Row(children: [
//customDescriptionTextText(context: context,
//text: "Avialability", percentageOfHeight:
//.028 , textAlign: TextAlign.start ),
//],),
//Container(
//width:
//width *
//.9,
//height: isLandscape(
//context)
//? 2 *
//height *
//.1
//: height *
//.1,
//child: ListView.builder(
////                                          shrinkWrap: true,
////                                        physics: BouncingScrollPhysics(),
//scrollDirection: Axis.horizontal,
//itemCount: 10 ,
////                                                    cubit.singleBarberModel.data.specifications.length,
//itemBuilder: (context, indexForServices) {
//return Row(
//children: [
//Container(margin: EdgeInsets.only(left: width*.02),
//width: width*.5,height: height*.08,
//decoration: BoxDecoration(color: backGroundColor , borderRadius:
//BorderRadius.circular(8)),child: Center(child: customDescriptionTextText(context: context,text: "Hair Cut " , percentageOfHeight: .02),),
//
//
//),
//],
//);
//})),
//responsiveSizedBox(context: context , percentageOfHeight: .02),
//Row(mainAxisAlignment : MainAxisAlignment.spaceBetween,
//children: [
//customDescriptionTextText(context: context,
//text: "Reviews", percentageOfHeight:
//.028 , textAlign: TextAlign.start ),
//GestureDetector(onTap: (){},
//child: customDescriptionTextText(context: context,
//text: "view all", percentageOfHeight:
//.028 , textAlign: TextAlign.start ,textColor: blueColor ),)
//],),
//responsiveSizedBox(context: context , percentageOfHeight: .02),
//
//Container(
//width:
//width *
//.9,
//height: isLandscape(
//context)
//? 2 *
//height *
//.1
//: height *
//.1,
//child: ListView.builder(
////                                          shrinkWrap: true,
////                                        physics: BouncingScrollPhysics(),
//scrollDirection: Axis.horizontal,
//itemCount: 10 ,
////                                                    cubit.singleBarberModel.data.specifications.length,
//itemBuilder: (context, indexForServices) {
//return Row(
//children: [
//Container(margin: EdgeInsets.only(left: width*.02),
//width: width*.7,height: height*.08,
//decoration: BoxDecoration(color: backGroundColor , borderRadius:
//BorderRadius.circular(8)),child: Row(children: [
//SizedBox(width: width*.03,),
//Icon(Icons.star, size: height*.03
//,color: yellowColor,) ,
//SizedBox(width: width*.03,),
//customDescriptionTextText(context: context,text: "4.5" ,textColor: Colors.black, percentageOfHeight: .022),
//SizedBox(width: width*.03,),
//customDescriptionTextText(context: context,text: "very good barber" , percentageOfHeight: .02)
//
//],),
//
//
//),
//],
//);
//})),
//responsiveSizedBox(context: context , percentageOfHeight: .01),
//
//
//
//CustomButton(text: "Book Appointment", onTapButton: (){showBottomSheetMenuForAddingCard(context: context);},)
//
//
//],
//
//),
//),
//)),
//),
//],
//),
//
//))
//
//
//)
