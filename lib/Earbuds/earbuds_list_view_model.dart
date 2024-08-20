import 'package:flutter/material.dart';
import 'package:your_ear_fits/Earbuds/earbuds_list_repository.dart';
import 'package:your_ear_fits/Earbuds/earbuds_model.dart';

class EarbudsListViewModel extends ChangeNotifier {
  final EarbudsListRepository _earbudsListRepository = EarbudsListRepository();
  List<EarbudsModel> earbudsList = [];

  /// 이어폰 목록 화면의 뷰 모델
  EarbudsListViewModel();

  /// 이어폰 목록을 불러옵니다.
  /// [searchValue]가 null이거나 빈 문자열인 경우 모든 이어폰을 불러옵니다.
  /// [searchValue]가 null이 아니거나 빈 문자열이 아닌 경우 해당 문자열을 포함하는 이어폰을 불러옵니다.
  /// 불러온 이어폰 목록은 [earbudsList]에 저장됩니다.
  /// 불러온 이어폰 목록이 변경되면 notifyListeners()를 호출하여 화면을 갱신합니다.
  Future<void> loadEarbudsList({String? searchValue}) async {
    earbudsList.clear();
    if (searchValue == null || searchValue.isEmpty) {
      await _loadAllEarbuds();
    } else {
      await _loadEarbudsByName(searchValue);
    }
    notifyListeners();
  }

  Future<void> _loadAllEarbuds() async {
    earbudsList.addAll(await _earbudsListRepository.getEarbudsList());
  }

  Future<void> _loadEarbudsByName(String searchValue) async {
    earbudsList
        .addAll(await _earbudsListRepository.getEarbudsListByName(searchValue));
  }
}
