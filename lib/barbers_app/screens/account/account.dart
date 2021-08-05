import 'package:almezynbarber/barbers_app/screens/account/chamge_language.dart';
import 'package:almezynbarber/barbers_app/screens/account/contact_us.dart';
import 'package:almezynbarber/barbers_app/screens/account/faqs.dart';
import 'package:almezynbarber/barbers_app/screens/account/profile.dart';
import 'package:almezynbarber/custom_widgets/single_account_button.dart';
import 'package:almezynbarber/custom_widgets/user_data.dart';
import 'package:almezynbarber/network/cache_helper.dart';
import 'package:almezynbarber/utils/constants.dart';
import 'package:almezynbarber/utils/file_export.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
class BarberAccountScreen extends StatefulWidget {
  @override
  _BarberAccountScreenState createState() => _BarberAccountScreenState();
}

class _BarberAccountScreenState extends State<BarberAccountScreen> {

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
        withoutCartIcon: true,
        withoutBackIcon: true,
        isWithoutLogo: true,
        headerText:"Account",
        paddingPercentageForBody: 0.0,
        columnOfWidgets: Column(
          children: [
            Container(
              height: height,
              child: NestedScrollView(
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      SliverAppBar(
                        automaticallyImplyLeading: false,
                        leading: null,
                        expandedHeight: isLandscape(context)
                            ? 2 * height * .26
                            : height * .26,
                        backgroundColor: whiteColor,
                        floating: false,
                        pinned: false,
                        flexibleSpace: FlexibleSpaceBar(
                            background: Container(
                              child: Column(
                                children: [
                                  userData(context: context , userName: userName , userNumber:
                                  userNumber, switchType: userType == "user" ? "" :
                                  "" , userImage: "${baseImageUrl}${userImage}" ),                                ],
                              ),
                            )),
                      ),
                    ];
                  },
                  body: Container(height: height*.8,
                    padding:
                    EdgeInsets.only(right: width * .05, left: width * .05),
                    color: backGroundColor,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          responsiveSizedBox(
                              context: context, percentageOfHeight: .04),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              singleAccountCard(
                                  context: context,
                                  title: "My Profile",
                                  subtitle: "Profile details",
                                  iconData: Icons.payments,
                                  onTap: () {
//                                    customAnimatedPushNavigation(context, ProfileScreen(barberId: userId,));
                                  }),
                              singleAccountCard(
                                  context: context,
                                  title: "Contact Us",
                                  subtitle: "Let Us Help You",
                                  iconData: Icons.message,
                                  onTap: () {
                                    customAnimatedPushNavigation(context, ContactUsScreen());

                                  }),
                            ],
                          ),
                          responsiveSizedBox(
                              context: context, percentageOfHeight: .02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              singleAccountCard(
                                  context: context,
                                  title: "T&C",
                                  subtitle: "Privacy Policy",
                                  iconData: Icons.question_answer,
                                  onTap: () {
                                    customAnimatedPushNavigation(context, FaqsScreen());
                                  }),
                              singleAccountCard(
                                  context: context,
                                  title: "FAQs",
                                  subtitle: "Quick Answers",
                                  iconData: Icons.description,
                                  onTap: () {
                                    customAnimatedPushNavigation(context, FaqsScreen());
                                  }),
                            ],
                          ),
                          responsiveSizedBox(
                              context: context, percentageOfHeight: .02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              singleAccountCard(
                                  context: context,
                                  title: "Languages",
                                  subtitle: "Change Language",
                                  iconData: Icons.language,
                                  onTap: () {
                                    customAnimatedPushNavigation(context, ChangeLanguageScreen());

                                  }),
                              singleAccountCard(
                                  context: context,
                                  title: "Logout",
                                  subtitle: "Tap To Logout",
                                  iconData: Icons.logout,
                                  onTap: () {
                                    showCustomAlertDialog(context: context, withTwoButtons: true , onTapSecondButton:
                                        (){
                                      Navigator.of(context).pop();
                                      CacheHelper.clearData(key: "token");
                                    } ,
                                        alertTitle: translator.translate("Logout") , alertSubtitle: "are you sure you want to logout the app ? ",
                                        secondButtoText:  "yes");
                                  }),
                            ],
                          ),
                          responsiveSizedBox(
                              context: context, percentageOfHeight: .02),
                          responsiveSizedBox(
                              context: context, percentageOfHeight: .1),


                        ],
                      ),
                    ),
                  )),
            ),
          ],
        ),
        onTapNotifications: () {
          print("notifications  icon pressed ");
        },
      ),
    );
  }
}

