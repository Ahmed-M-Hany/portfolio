import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'project_index_state.dart';

class ProjectIndexCubit extends Cubit<ProjectIndexState> {
  ProjectIndexCubit(this.index) : super(ProjectIndexInitial());
  final int index;
}
