import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/cubit/states.dart';

import 'package:app/buisness/buisness_screen.dart';
import 'package:app/science/science_screen.dart';
import 'package:app/sports/sports_screen.dart';

import '../network/dio_help.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(Initial());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;


  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  List<BottomNavigationBarItem> bottomItems = const [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
    //BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
  ];

  void selectedPage(value) {
    currentIndex = value;
    if (value == 1) sportsData();
    if (value == 2) scienceData();
    emit(NewsBottomNavChange());
  }

  List<dynamic>  businessList=[];

  void businessData() {

    emit(NewsGetBusinessLoadingState());

    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': '54d372ad3d5c48ddb412201593435ccd',
    })?.then((value) {

      businessList.addAll(value?.data['articles']);

      print(businessList.length);
      // businessList = newData?.data['articles'];
      //print(businessList[0]['title']);
      emit(NewsGetBusinessSuccessState());
    }).catchError((error){
      emit(NewsGetBusinessErrorState(error));
    });
  }

  List<dynamic> scienceList = [];

  void scienceData() {

    emit(NewsGetScienceLoadingState());

    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'science',
      'apiKey': '54d372ad3d5c48ddb412201593435ccd',
    })?.then((newData) {

      scienceList.addAll(newData?.data['articles']);
      emit(NewsGetScienceSuccessState());
    });
  }

  List<dynamic> sportsList = [];

  void sportsData() {
    emit(NewsGetSportsLoadingState());
    if (sportsList.isEmpty) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': '54d372ad3d5c48ddb412201593435ccd',
      })?.then((value) {
        sportsList = value?.data['articles'];
        emit(NewsGetSportsSuccessState());
      });
    } else {
      emit(NewsGetSportsSuccessState());
    }
  }

  List<dynamic> searchList = [];

  void searchData(String value) {
    emit(NewsGetSearchLoadingState());
    DioHelper.getData(
            url: 'v2/everything',
            query: {'q': value, 'apiKey': '54d372ad3d5c48ddb412201593435ccd'})
        ?.then((value) {
      searchList = value?.data['articles'];
      emit(NewsGetSearchSuccessState());
      print(searchList);
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSearchSuccessState());
    });
  }
}
