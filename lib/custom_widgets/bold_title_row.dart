import 'dart:ui';
import 'package:almezynbarber/utils/file_export.dart';

boldTitleRow({BuildContext context, String text , Function onTapViewMore , bool withViewMore : true
  , Color textColor : textColor , FontWeight fontWeight : FontWeight.normal  , double heightPercentage : .025}) {
  return Container(padding: EdgeInsets.only(right: width(context)*.05 , left: width(context)*.05),
    width: width(context)*.9,
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
       text ,
          style: TextStyle(
            fontWeight: fontWeight,
              color: textColor ,
              fontSize: isLandscape(context)
                  ? 2 * height(context) * heightPercentage
                  : height(context) * heightPercentage),
        ) ,
        withViewMore == true ?
        GestureDetector(onTap: onTapViewMore,child:
          customDescriptionTextText(context:context ,text: "View All"
              , fontWeight: FontWeight.bold , textColor: blueColor , percentageOfHeight: .025 ),): SizedBox()
      ],
    ),
  );
}
