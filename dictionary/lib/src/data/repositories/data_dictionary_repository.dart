// ignore_for_file: curly_braces_in_flow_control_structures
import 'package:dictionary/src/domain/entities/dictionary.dart';
import 'package:dictionary/src/domain/repositories/dictionary_repository.dart';

class DataDictionaryRepository implements DictionaryRepository {
  @override
  Future<Dictionary> getWord(String word) async {
    if (word == 'elma')
      return Dictionary("Ekşisi makbul olan meyve", "elma");
    else
      return Dictionary("Elmadan bir tık daha iyi olan meyve", "armut");
  }
}
