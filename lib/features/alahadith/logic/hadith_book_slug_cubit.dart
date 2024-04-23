import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import '../../../utils/strings.dart';
import '../models/hadith_model.dart';
import 'hadith_book_slug_state.dart';

class HadithBookSlugCubit extends Cubit<HadithBookSlugState> {
  HadithBookSlugCubit() : super(HadithBookSlugLoadingState());

  getBookDataBySlug(chapter, book) async {
    try {
      final url = Uri.parse("${urlSlugAn}&chapter=$chapter&book=$book");
      print("$url");
      {}
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
      );
        final decodedData = jsonDecode(utf8.decode(response.bodyBytes));
        print("::::>$decodedData");
        if (decodedData.containsKey('hadiths')) {
          final hadiths = HadithModel.fromJsonList(decodedData['hadiths']['data']);
          emit(HadithBookSlugLoadedState(hadithList: hadiths));
        }
    } catch (error) {
      print('Error: $error');
    }
  }
}
