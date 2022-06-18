// ignore_for_file: avoid_print

import 'package:dictionary/src/app/pages/home_presenter.dart';
import 'package:dictionary/src/domain/entities/dictionary.dart';
import 'package:dictionary/src/domain/repositories/dictionary_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class HomeController extends Controller {
  final HomePresenter _presenter;

  HomeController(
    DictionaryRepository dictionaryRepository,
  ) : _presenter = HomePresenter(
          dictionaryRepository,
        );

  Dictionary? dictionary;

  @override
  void initListeners() {
    _presenter.getWordOnNext = (Dictionary response) {
      dictionary = response;
      refreshUI();
    };
    _presenter.getWordOnError = (e) {
      print("Error getWord");
    };
  }

  @override
  void onDisposed() {
    _presenter.dispose();
    super.onDisposed();
  }

  void getWord(String word) {
    _presenter.getWord(word);
  }
}
