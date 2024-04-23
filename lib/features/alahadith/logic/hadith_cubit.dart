import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import '../../../utils/strings.dart';
import '../models/hadith_book_model.dart';
import 'hadith_state.dart';

class HadithCubit extends Cubit<HadithState> {
  HadithCubit() : super(HadithIntial());
  

  
  getHadithBooks() async {
    emit(HadithIntial());
      final url = Uri.parse(urlhadithBooks);
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final decodedData = jsonDecode(utf8.decode(response.bodyBytes));
        print("::::>$decodedData");
        if (decodedData.containsKey('books')) {
          final hadithBooksList =
              HadithBookModel.fromJsonList(decodedData['books']);
          emit(HadithLoaded(
            hadithModel: hadithBooksList,
          ));
        } else {
          emit(
            HadithError(
                messageError:
                    'Error: Invalid response format, "hadiths" key not found.'),
          );
        }
    }
  }
}
