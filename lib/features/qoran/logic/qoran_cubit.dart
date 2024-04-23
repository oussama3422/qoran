import 'package:bloc/bloc.dart';
import 'package:audio_app/services/api.dart';

import '../models/qoran_model.dart';



class QuranCubit extends Cubit<List<QoranModel>> {
  final Api api = Api();

  QuranCubit() : super([]);

  Future<void> loadQuran() async {
    emit([]);
    try {
      // final qoranModelList = await Future.wait(listOfQoran.map((qoranModel) async {
      //   return QoranModel(audioUrl: (await qoranModel.getAudioUri()).toString());
      // }));
      final qoranModelList = await api.getQoranList();
      emit(qoranModelList);
    } catch (e) {
      print('error: $e');
      // Handle error accordingly
    }
  }
}

// enum QuranState { loading, loaded, error }

// class QuranCubit extends Cubit<List<QoranModel>> {
//   final Api api = Api();

//   QuranCubit() : super([]);

//   Future<void> loadQuran() async {
//     emit([]);
//     try {
//       final qoranModel = listOfQoran;
//       print(qoranModel);
//       emit(qoranModel);
//     } catch (e) {
//       print('error');
//       // emit();
//     }
//   }
// }
