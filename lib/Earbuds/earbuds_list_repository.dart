import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:your_ear_fits/Earbuds/earbuds_model.dart';

class EarbudsListRepository {
  /// 정적 변수 _instance 선언
  /// 이 줄은 EarbudsListRepository 클래스의 유일한 인스턴스를 저장하는 정적 변수를 선언합니다.
  /// 이 변수는 클래스가 로드될 때 한 번만 초기화됩니다.
  static final EarbudsListRepository _instance =
      EarbudsListRepository._internal();

  /// 프라이빗 생성자 _internal
  /// 이 줄은 프라이빗 생성자를 정의합니다.
  /// 이 생성자는 클래스 외부에서 직접 호출할 수 없으며, 클래스 내부에서만 호출할 수 있습니다.
  /// 이 생성자는 _instance 변수를 초기화할 때 사용됩니다.
  EarbudsListRepository._internal();

  /// 팩토리 생성자
  /// 이 줄은 팩토리 생성자를 정의합니다.
  /// 팩토리 생성자는 새로운 인스턴스를 생성하는 대신, 이미 생성된 인스턴스를 반환합니다.
  /// 이 경우, 항상 _instance 변수를 반환합니다.
  factory EarbudsListRepository() {
    return _instance;
  }

  /// Supabase를 사용하여 데이터베이스에서 이어폰 목록을 가져옵니다.
  /// 데이터베이스에서 가져온 이어폰 목록은 EarbudsModel 객체의 리스트로 변환됩니다.
  Future<List<EarbudsModel>> getEarbudsList() async {
    final supabase = Supabase.instance.client;
    final response = await supabase.from('products').select();

    var list = List<EarbudsModel>.empty(growable: true);
    for (var data in response) {
      list.add(EarbudsModel.fromJson(data));
    }
    return list;
  }

  /// Supabase를 사용하여 데이터베이스에서 이름으로 이어폰 목록을 가져옵니다.
  /// 데이터베이스에서 가져온 이어폰 목록은 EarbudsModel 객체의 리스트로 변환됩니다.
  Future<List<EarbudsModel>> getEarbudsListByName(String search) async {
    final supabase = Supabase.instance.client;
    final response = await supabase.from('products').select().or(
        'name.ilike.%$search%,headline.ilike.%$search%,specs.ilike.%$search%,release_date.ilike.%$search%');

    var list = List<EarbudsModel>.empty(growable: true);
    for (var data in response) {
      list.add(EarbudsModel.fromJson(data));
    }
    return list;
  }
}
