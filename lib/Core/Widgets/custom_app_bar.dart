import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news/Core/Utils/app_router.dart';
import 'package:news/Cubit/App_cubit/app_cubit.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.cubit,required this.onPressed,
  });

  final AppCubit cubit;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(cubit.titles[cubit.currentIndex]),
      actions: [
        IconButton(onPressed: () {
          GoRouter.of(context).push(AppRouter.kSearchView);
        }, icon: const Icon(Icons.search)),
        IconButton(
          onPressed: onPressed,
          icon:  Icon(Icons.brightness_4_outlined,
          color:cubit.isDark ? Colors.white : Colors.black ,
          ),
        ),
      ],
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
