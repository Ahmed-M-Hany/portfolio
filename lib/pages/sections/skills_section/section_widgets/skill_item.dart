

import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/constants/skills_data.dart';
import 'package:portfolio/pages/sections/skills_section/cubit/skill_index_cubit.dart';

import '../../../../constants/colors.dart';
import 'blue_layer.dart';
import 'package:flip_card/flip_card.dart';
class SkillItem extends StatelessWidget {
   SkillItem();
  final GlobalKey<FlipCardState> cardKey =  GlobalKey<FlipCardState>();
  //controller
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<SkillIndexCubit>(context);
    var skill=SkillsData.skills[cubit.index];
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
                    Stack(
                      children: [
                        Image.asset(
                          skill.iconPath,
                          height: 30.sp,
                          width: 20.sp,
                          fit: BoxFit.contain,
                          // color: color,
                        ),
                        BlueLayer(imagePath: skill.iconPath, color: CustomColor.blue),
                      ],
                    ),
                  Text(
                    skill.name,
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
                  Text(skill.description),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
