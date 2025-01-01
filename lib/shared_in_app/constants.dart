import 'package:intl/intl.dart';

bool isArabic(){
    return Intl.getCurrentLocale()=='ar';
  }
  //example-----
  // Row(children: [
  //       Padding(
  //         padding:  EdgeInsets.only(right: isArabic()?30:0,left:isArabic()?0:30),
  //         child: Text(S.of(context).Hello),
  //       ),
  //       SizedBox(width: 10,),
  //       Text(S.of(context).name),
  //     ],),

//-----------------------------------------------------  