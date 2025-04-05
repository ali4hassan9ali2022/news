import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Core/Widgets/custom_app_bar.dart';
import 'package:news/Cubit/App_cubit/app_cubit.dart';

class NewsMainView extends StatelessWidget {
  const NewsMainView({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<AppCubit>(context);
    return Scaffold(
      appBar: CustomAppBar(cubit: cubit),
    );
  }
}

