import 'package:almezynbarber/network/cache_helper.dart';
import 'package:almezynbarber/utils/constants.dart';
import 'package:almezynbarber/utils/file_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:almezynbarber/app_cubits/rates/rate_states.dart';
import 'package:almezynbarber/app_cubits/rates/rate_cubit.dart';
class BarberReviewsScreen extends StatefulWidget {
  @override
  _BarberReviewsScreenState createState() => _BarberReviewsScreenState();
}
class _BarberReviewsScreenState extends State<BarberReviewsScreen> {

  String userName = "" ;
  String userNumber   = "";
  String userType = "" ;
  String userId = "" ;
  String userImage = "" ;
  String userEmail = "" ;

  getUserData()async{

    DioHelper.init();
    await CacheHelper.init();
    setState(() {
      userName  = CacheHelper.getStringData(key: 'user_name');
      userNumber  = CacheHelper.getStringData(key: 'user_phone');
      userEmail  = CacheHelper.getStringData(key: 'user_email');
      userType  = CacheHelper.getStringData(key: 'user_type');
      userId  = CacheHelper.getStringData(key: 'user_id').toString();
      userImage  = CacheHelper.getStringData(key: 'user_image');
    });
  }


  @override
  void initState() {
    getUserData();}

  @override

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: CustomBuildBody(
        isWithoutLogo: true,
        withoutBackIcon: true,
        withoutCartIcon: true,
        headerText: "Reviews",
        paddingPercentageForBody: 0.05,
        columnOfWidgets: Column(
          children: [
            BlocProvider(
              create: (BuildContext context) => AllRatesCubit()..getAllRates(userId.toString()),
              child: BlocConsumer<AllRatesCubit, AllRatesStates>(
                listener: (context, state) {},
                builder: (context, state) {
                  var cubit = AllRatesCubit.get(context);
                  if (state is! AllRatesLoadingState) {
                    return Container(
                      height: height,
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
                                    background: Container(
                                  child: Image.network("${baseImageUrl}${userImage}")
                                )),
                              ),
                            ];
                          },
                          body: Container(
                            height: height * .8,
                            padding: EdgeInsets.only(
                                right: width * .05, left: width * .05),
                            color: backGroundColor,
                            child: SingleChildScrollView(child: Container(
                              child: Column(children: [

                                responsiveSizedBox(context: context ,percentageOfHeight: .05),
                                Column(
                                  children: [

                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: [
                                        customDescriptionTextText(
                                            context: context,
                                            text: " Total Rates :",
                                            textColor: blackColor,
                                            fontWeight: FontWeight.bold,
                                            percentageOfHeight: .03),
                                        SizedBox(width: 5,),
                                        customDescriptionTextText(
                                            context: context,
                                            text: cubit.allRatesModel.rate
                                                .toString() , fontWeight: FontWeight.bold ,
                                            percentageOfHeight: .03 ,textColor: blueColor),
                                      ],
                                    ) ,
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: [
                                        customDescriptionTextText(
                                            context: context,
                                            text: "Total People Rated  :",
                                            textColor: blackColor,
                                            fontWeight: FontWeight.bold,
                                            percentageOfHeight: .03),
                                        SizedBox(width: 5,),
                                        customDescriptionTextText(
                                            context: context,
                                            text: cubit.allRatesModel.totalPeopleRate
                                                .toString() , fontWeight: FontWeight.bold ,
                                            percentageOfHeight: .03 ,textColor: blueColor),
                                      ],
                                    ) ,
                                  ],
                                ),
                                  Column(
                                    children: [
                                      Container(height: height*.7,
                                        child: ListView.builder(
                                          itemCount: cubit.allRatesModel.data.length,
                                         itemBuilder : (context  , index )=>
                                           Container(margin: EdgeInsets.only(bottom: 10),
                                             child: Row(
                                               children: [
                                                 CircleAvatar(child: Image.network
                                                   ("${baseImageUrl}${cubit.allRatesModel.data[index].user.image}"),) ,

                                                 SizedBox(width: 15),
                                                 Column(crossAxisAlignment: CrossAxisAlignment.start,
                                                   children: [
                                                    Row(children: [
                                                      customDescriptionTextText(context:
                                                      context
                                                          , fontWeight: FontWeight.bold , textColor: blackColor ,textAlign: TextAlign.start,
                                                          text:
                                                          cubit.allRatesModel.data[index].user.name) ,
                                                       SizedBox(width: 10,) ,
                                                      customDescriptionTextText(context:
                                                      context
                                                          , fontWeight: FontWeight.bold , textColor: blackColor ,textAlign: TextAlign.start,
                                                          text:
                                                          cubit.allRatesModel.data[index].rate.toString()) ,
                                                      Icon(Icons.star , color: yellowColor,),
                                                    ],) ,


                                                     SizedBox(width: 5,) ,
                                                     responsiveSizedBox(context: context ,percentageOfHeight: .01)
,                                                customDescriptionTextText(context:
                                                     context ,
                                                         text:
                                                         cubit.allRatesModel.data[index].review)
                                                   ],
                                                 )
                                               ],
                                             ),
                                           ) ),
                                      ),
                                    ],
                                  )
                                ],),
                            )),
                          )),
                    );
                  }
                  return spinKit;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
