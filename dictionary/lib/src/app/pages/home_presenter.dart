import 'package:dictionary/src/domain/entities/dictionary.dart';
import 'package:dictionary/src/domain/repositories/dictionary_repository.dart';
import 'package:dictionary/src/domain/usecases/get_word.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class HomePresenter extends Presenter {
  late Function getWordOnNext;
  late Function getWordOnError;

  final GetWord _getWord;

  HomePresenter(
    DictionaryRepository dictionaryRepository,
  ) : _getWord = GetWord(dictionaryRepository);

  void getWord(String word) {
    _getWord.execute(_GetWordObserver(this), GetWordParams(word));
  }

  @override
  void dispose() {
    _getWord.dispose();
  }
}

class _GetWordObserver extends Observer<Dictionary> {
  final HomePresenter _presenter;
  _GetWordObserver(this._presenter);

  @override
  void onComplete() {}

  @override
  void onError(e) {
    _presenter.getWordOnError(e);
  }

  @override
  void onNext(Dictionary? response) {
    _presenter.getWordOnNext(response);
  }
}
