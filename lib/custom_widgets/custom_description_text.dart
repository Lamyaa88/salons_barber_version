import 'dart:ui';
import 'package:almezynbarber/utils/check_direction.dart';
import 'package:almezynbarber/utils/file_export.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

customDescriptionTextText({
  BuildContext context, String text : ''
  , double  percentageOfHeight : .019, Color textColor : greyColor
  , FontWeight fontWeight : FontWeight.normal  , textAlign :
  TextAlign.center, decoration : null ,fontStyle  : FontStyle.normal  , int  maxLines  : 1 }) {
  return Text(

    translator.translate(text),
    textAlign:textAlign ,
    maxLines:maxLines,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      fontStyle: fontStyle ,
       decoration:decoration  ,
      fontWeight: fontWeight ,
        color: textColor ,
        fontSize: isLandscape(context)
            ? 2 * height(context) *percentageOfHeight
            : height(context) *percentageOfHeight ),
  );
}
