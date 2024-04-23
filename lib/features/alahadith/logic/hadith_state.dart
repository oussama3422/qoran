import '../models/hadith_book_model.dart';

class HadithState {}

class HadithIntial extends HadithState {}

class HadithLoaded extends HadithState {
   List<HadithBookModel> hadithModel;
  HadithLoaded({required this.hadithModel});
}


class HadithError extends HadithState {
  String messageError;
  HadithError({required this.messageError});
}
