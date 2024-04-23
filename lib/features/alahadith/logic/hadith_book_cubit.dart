import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../utils/strings.dart';
import '../models/hadith_book_slug.dart';
import 'hadith_book_state.dart';
import 'package:http/http.dart' as http;

class HadithBookCubit extends Cubit<HadithBookState> {
  HadithBookCubit() : super(HadithBookInitial());

  getBookDataBySlug(bookSlug, ) async {
    emit(HadithBookInitial());
    final response = await http.get(
      Uri.parse(
          'https://www.hadithapi.com/api/$bookSlug/chapters?apiKey=${apiKey}'),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final decodedData = jsonDecode(utf8.decode(response.bodyBytes));
      print("::::>$decodedData");
      if (decodedData.containsKey('chapters')) {
        final bookSlugs = BookSlug.fromJsonList(decodedData['chapters']);
        emit(HadithBookLoaded(booksSlugList: bookSlugs));
      } else {
        emit(HadithBookError(
            message:
                'Error: Invalid response format, "hadiths" key not found.'));
      }
    }
  }
}
