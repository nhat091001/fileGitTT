import 'package:test_mvvm/model/picsum_model.dart';
import 'package:test_mvvm/service/services.dart';

class ListPictureViewModel {
  late List<PictureViewModel>? picture;

  Future<void> fetchPictures() async {
    final apiResult = await Servive().fetchPictureAPI();
    this.picture = apiResult.map((e) => PictureViewModel(e)).toList();
  }
}

class PictureViewModel {
  late final PicSumModel? picSumModel;
  PictureViewModel(this.picSumModel);
}
