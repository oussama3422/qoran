import '../models/hadith_book_slug.dart';

class HadithBookState {}

class HadithBookInitial extends HadithBookState {}

class HadithBookLoaded extends HadithBookState {
  List<BookSlug> booksSlugList;
  HadithBookLoaded({required this.booksSlugList});
}

class HadithBookError extends HadithBookState {
  String message;
  HadithBookError({required this.message});
}
