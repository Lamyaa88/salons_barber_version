import 'package:almezynbarber/utils/file_export.dart';
userData({BuildContext context  , String userName : "" ,String userNumber : ""  , String switchType : ""  , userImage :"" }){
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return Container(
    width: width*.9,
    child: Column(
      children: [
        responsiveSizedBox(context: context , percentageOfHeight: .03) ,
        Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(height: isLandscape(context) ?  2*height*.15 :height*.15,width: width*.3 , decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(userImage),
                fit: isLandscape(context) ?  BoxFit.fitHeight :  BoxFit.cover,
              ),
            ),),
          ],
        ),
        responsiveSizedBox(context: context , percentageOfHeight: .0) ,

        Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customDescriptionTextText(context: context , text:userName, textColor: blackColor ,
                percentageOfHeight: .03, fontWeight: FontWeight.bold),
            responsiveSizedBox(context: context , percentageOfHeight: .01) ,


          ],),
        responsiveSizedBox(context: context , percentageOfHeight: .01) ,

        Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customDescriptionTextText(context: context , text: userNumber,
                percentageOfHeight: .02),
            responsiveSizedBox(context: context , percentageOfHeight: .01) ,


          ],),

        Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
        GestureDetector(child:     customDescriptionTextText(context: context  , text: switchType , textColor: blueColor,
            percentageOfHeight: .02),onTap: (){},),
            responsiveSizedBox(context: context , percentageOfHeight: .01) ,


          ],),

      ],
    ),

  );
}