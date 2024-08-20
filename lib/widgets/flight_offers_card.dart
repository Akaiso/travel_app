

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'hover_effect_button.dart';

class FlightOffersModel extends StatefulWidget {
    const FlightOffersModel({super.key, });



  @override
  State<FlightOffersModel> createState() => _FlightOffersModelState();
}

class _FlightOffersModelState extends State<FlightOffersModel> {

  Color color = Colors.orange;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {

    return  Container(
      decoration:  BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(5)
      ),
      height: MediaQuery.of(context).size.height * 0.26,
      width: MediaQuery.of(context).size.width * 0.3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FittedBox(
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                clipBehavior: Clip.hardEdge,
                height: MediaQuery.of(context).size.height * 0.26,
                width: MediaQuery.of(context).size.width * 0.15,
                child: Image.asset('assets/images/image1.png', fit: BoxFit.cover,),
              ),
              Container(color: Colors.yellow,
                height: MediaQuery.of(context).size.height * 0.26,
                width: MediaQuery.of(context).size.width * 0.125,
                child:  const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: FittedBox(
                    child : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('One Way', style: TextStyle(fontSize: 10,),),
                        Padding(
                          padding: EdgeInsets.only(top:3.0, bottom: 8),
                          child: Text('Abuja -> Doha', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),),
                        ),
                        Text('Pay Now', style: TextStyle(fontSize: 10,),),
                         Padding(
                          padding: EdgeInsets.only(top:3.0, bottom: 8),
                          child: Text('₦ 1,300,456', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),),
                        ),
                        HoverEffectButton(fontWeight: FontWeight.w600,fontSize: 13, text: 'Book Now',),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
