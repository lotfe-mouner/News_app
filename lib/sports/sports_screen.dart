import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../cubit/cubit.dart';
import '../cubit/states.dart';
import '../shared/components/components.dart';

class SportsScreen extends StatelessWidget {
   SportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        List sportsList = NewsCubit.get(context).sportsList;
        return articleScreenBuilder(sportsList,context);
      },
    );
  }
}
