import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/cubit/cubit.dart';
import 'package:app/cubit/states.dart';
import 'package:app/shared/components/components.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var searchList = NewsCubit.get(context).searchList;
        return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    decoration:  InputDecoration(
                      label: Text('Search',style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.normal
                      ),),
                      prefix: const Icon(Icons.search),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(width: 0.5),
                      ),
                    ),
                    controller: searchController,
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      NewsCubit.get(context).searchData(value);
                    },
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'search must not be empty';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Expanded(child: articleScreenBuilder(searchList, context,true))
              ],
            ));
      },
    );
  }
}
