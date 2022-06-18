import 'package:dictionary/src/domain/entities/dictionary.dart';

abstract class DictionaryRepository {
  Future<Dictionary> getWord(String word);
}
