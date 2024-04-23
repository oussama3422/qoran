import '../models/hadith_model.dart';

class HadithBookSlugState {}

class HadithBookSlugLoadingState extends HadithBookSlugState {}

class HadithBookSlugLoadedState extends HadithBookSlugState {
  List<HadithModel> hadithList;
  HadithBookSlugLoadedState({required this.hadithList});
}

class HadithBookSlugOccurredErrorState extends HadithBookSlugState {
  String errorMsg;
  HadithBookSlugOccurredErrorState({required this.errorMsg});
}
