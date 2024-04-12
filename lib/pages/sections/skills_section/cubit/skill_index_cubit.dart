import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'skill_index_state.dart';

class SkillIndexCubit extends Cubit<SkillIndexState> {
  SkillIndexCubit({required this.index}) : super(SkillIndexInitial());
  final int index;
}
