


import 'dart:ui';

import 'package:flutter/material.dart';

 TextStyle normal(){
return const TextStyle(fontSize: 13,fontWeight: FontWeight.w200);
}

TextStyle boldNormal(){
 return const TextStyle(fontSize: 13,fontWeight: FontWeight.w900);
}

TextStyle blueNormal(){
 return const TextStyle(color: Colors.blue,fontSize: 13,fontWeight: FontWeight.w200);
}

TextStyle whiteNormal(){
 return const TextStyle(color: Colors.white,fontSize: 13,fontWeight: FontWeight.w200);
}

TextStyle subtitle(){
 return const TextStyle(fontSize: 30,fontWeight: FontWeight.w700);
}

TextStyle boldSubtitle2(){
 return const TextStyle(fontSize: 25,fontWeight: FontWeight.w700);
}

TextStyle whiteSubtitle(){
 return const TextStyle(fontSize: 30,fontWeight: FontWeight.w700,color: Colors.white);
}

TextStyle? title(){
 return const TextStyle(fontSize: 35,fontWeight: FontWeight.w900);
}

TextStyle? small(){
 return const TextStyle(fontSize: 10,fontWeight: FontWeight.normal);
}

TextStyle? boldSmall(){
 return const TextStyle(fontSize: 10,fontWeight: FontWeight.w900);
}


TextStyle? whiteSmall(){
 return const TextStyle(fontSize: 10,fontWeight: FontWeight.normal);
}
