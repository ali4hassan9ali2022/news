import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Core/Widgets/category_list_view.dart';
import 'package:news/Core/Widgets/custom_error_widget.dart';
import 'package:news/Cubit/sciences_cubit/sciences_cubit.dart';
import 'package:news/Cubit/sciences_cubit/sciences_state.dart';


class ScienceView extends StatelessWidget {
  const ScienceView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SciencesCubit, SciencesState>(
      builder: (context, state) {
        if (state is SuccessSciencesState) {
          return CategoryListView(
            itmes: state.sciences);
        } else if (state is FailureSciencesState) {
          return CustomErrorWidget(text: state.errMessage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}