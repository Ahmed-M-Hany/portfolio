

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/constants/skills_data.dart';
import 'package:portfolio/pages/sections/skills_section/cubit/skill_index_cubit.dart';

import '../../../../constants/colors.dart';
import 'blue_layer.dart';
import 'package:flip_card/flip_card.dart';
class SkillItem extends StatelessWidget {
   SkillItem({super.key});
  final GlobalKey<FlipCardState> cardKey =  GlobalKey<FlipCardState>();
  //controller
  @override
  Widget build(BuildContext context) {
    bool isMobile=
        MediaQuery.of(context).size.width < 600; // Check if the screen is mobile
    var cubit = BlocProvider.of<SkillIndexCubit>(context);
    var skill=SkillsData.skills[cubit.index];
    // TODO: implement build
    return SizedBox(
      height: isMobile?160:240,
      width: isMobile?120:180,
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
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Stack(
                      children: [
                        Image.asset(
                          skill.iconPath,
                          height: isMobile?90:150,
                          width: isMobile?60:100,
                          fit: BoxFit.contain,
                          // color: color,
                        ),
                        BlueLayer(imagePath: skill.iconPath, color: CustomColor.blue),
                      ],
                    ),
                  Text(
                    skill.name,
                    style: const TextStyle(
                      fontSize: 16,
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
            child: SizedBox(
              height: 240,
              width: 190,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Center(
                        child: AutoSizeText(
                          skill.description,
                          maxLines: 10,
                          textAlign: TextAlign.start,
                          minFontSize: 8,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
