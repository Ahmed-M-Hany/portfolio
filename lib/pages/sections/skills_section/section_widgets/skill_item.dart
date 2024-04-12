

import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/colors.dart';
import 'blue_layer.dart';
import 'package:flip_card/flip_card.dart';
class SkillItem extends StatelessWidget {
   SkillItem(
      {super.key, required this.skillName, this.imagePath, this.color});
  final String skillName;
  final String? imagePath;
  final Color? color;
  final GlobalKey<FlipCardState> cardKey =  GlobalKey<FlipCardState>();
  //controller
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: 80.sp,
      width: 66.sp,
      child: MouseRegion(
        onEnter: (_) async{
          if(cardKey.currentState!.isFront){
            await cardKey.currentState!.toggleCard();
          }
        },
        onExit: (_) async{
          if(!(cardKey.currentState!.isFront)){
            await cardKey.currentState!.toggleCard();
          }
        },
        child: FlipCard(
          key: cardKey,
          front: Card(
            elevation: 10,
            surfaceTintColor: CustomColor.bgLight2,
            color: CustomColor.bgLight2,
            child: Padding(
              padding: EdgeInsets.all(8.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (imagePath != null)
                    Stack(
                      children: [
                        Image.asset(
                          imagePath!,
                          height: 30.sp,
                          width: 20.sp,
                          fit: BoxFit.contain,
                          // color: color,
                        ),
                        BlueLayer(imagePath: imagePath, color: color),
                      ],
                    ),
                  Text(
                    skillName,
                    style: TextStyle(
                      fontSize: 8.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
          back: Card(
            elevation: 10,
            surfaceTintColor: CustomColor.bgLight2,
            color: CustomColor.bgLight2,
            child: Padding(
              padding: EdgeInsets.all(8.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Skill Description"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
