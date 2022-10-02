abstract class NewsStates{}

class Initial extends NewsStates{}

class NewsBottomNavChange extends NewsStates{}



class NewsGetBusinessLoadingState extends NewsStates{
}

class NewsGetBusinessSuccessState extends NewsStates{
  NewsGetBusinessSuccessState();
}

class NewsGetBusinessErrorState extends NewsStates{
  final String error;
  NewsGetBusinessErrorState(this.error);
}


class NewsGetSportsLoadingState extends NewsStates{}

class NewsGetSportsSuccessState extends NewsStates{}

class NewsGetSportsErrorState extends NewsStates{
  final String error;
  NewsGetSportsErrorState(this.error);
}



class NewsGetScienceLoadingState extends NewsStates{
  NewsGetScienceLoadingState();
}

class NewsGetScienceSuccessState extends NewsStates{
  NewsGetScienceSuccessState();

}

class NewsGetScienceErrorState extends NewsStates{
  final String error;
  NewsGetScienceErrorState(this.error);
}

class NewsGetSearchLoadingState extends NewsStates{}

class NewsGetSearchSuccessState extends NewsStates{}

class NewsGetSearchErrorState extends NewsStates{
  final String error;
  NewsGetSearchErrorState(this.error);
}




