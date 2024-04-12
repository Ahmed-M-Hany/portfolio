

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/constants/skills_data.dart';
import 'package:portfolio/pages/sections/skills_section/cubit/skill_index_cubit.dart';
import 'package:portfolio/pages/sections/skills_section/section_widgets/skill_item.dart';

import '../../../constants/colors.dart';

class Skills extends StatelessWidget {
  const Skills({super.key});
  _createSkillList(){
    List<Widget> result=[];
    for(int i=0;i<SkillsData.skills.length;i++){
      result.add(BlocProvider<SkillIndexCubit>(
        create: (context) => SkillIndexCubit(index: i),
        child:  SkillItem(),
      ));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      color: CustomColor.bgLight1,
      child: Column(
        children: [
          SizedBox(
            height: 16.sp,
          ),
          Text(
            "Skills",
            style: TextStyle(
              fontSize: 16.sp,
              color: CustomColor.blue,
            ),
          ),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 4.sp,
            children:  _createSkillList(),
          ),
          SizedBox(
            height: 16.sp,
          ),
        ],
      ),
    );
  }
}
