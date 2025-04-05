import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Core/Widgets/category_list_view.dart';
import 'package:news/Core/Widgets/custom_error_widget.dart';
import 'package:news/Cubit/News_cubit/business_cubit.dart';
import 'package:news/Cubit/News_cubit/business_state.dart';

class BusinessView extends StatelessWidget {
  const BusinessView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BusinessCubit, BusinessState>(
      builder: (context, state) {
        if (state is SuccessBusinessState) {
          return CategoryListView(
            itmes: state.business);
        } else if (state is FailureBusinessState) {
          return CustomErrorWidget(text: state.errMessage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
