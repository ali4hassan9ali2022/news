import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Core/Widgets/category_list_view.dart';
import 'package:news/Core/Widgets/custom_error_widget.dart';
import 'package:news/Cubit/healths_cubit/healths_cubit.dart';
import 'package:news/Cubit/healths_cubit/healths_state.dart';


class HealthView extends StatelessWidget {
  const HealthView({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<HealthsCubit, HealthsState>(
      builder: (context, state) {
        if (state is SuccessHealthsState) {
          return CategoryListView(itmes: state.health);
        } else if (state is FailureHealthsState) {
          return CustomErrorWidget(text: state.errMessage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
