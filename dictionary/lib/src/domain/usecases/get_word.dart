import 'dart:async';

import 'package:dictionary/src/domain/entities/dictionary.dart';
import 'package:dictionary/src/domain/repositories/dictionary_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class GetWord extends UseCase<Dictionary, GetWordParams> {
  final DictionaryRepository _dictionaryRepository;

  GetWord(this._dictionaryRepository);

  @override
  Future<Stream<Dictionary?>> buildUseCaseStream(GetWordParams? params) async {
    StreamController<Dictionary> controller = StreamController<Dictionary>();

    try {
      final Dictionary response =
          await _dictionaryRepository.getWord(params!.word);
      controller.add(response);
      controller.close();
    } catch (e) {
      controller.addError(e);
    }

    return controller.stream;
  }
}

class GetWordParams {
  final String word;
  GetWordParams(this.word);
}
