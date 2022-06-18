// ignore_for_file: avoid_web_libraries_in_flutter, no_logic_in_create_state, curly_braces_in_flow_control_structures, prefer_const_constructors, use_key_in_widget_constructors, annotate_overrides

import 'package:dictionary/src/app/pages/home_controller.dart';
import 'package:dictionary/src/data/repositories/data_dictionary_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class HomeView extends View {
  @override
  State<StatefulWidget> createState() {
    return _HomeViewState(
      HomeController(
        DataDictionaryRepository(),
      ),
    );
  }
}

class _HomeViewState extends ViewState<HomeView, HomeController> {
  _HomeViewState(HomeController controller) : super(controller);

  Widget get view {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ControlledWidgetBuilder<HomeController>(
            builder: (context, controller) {
              if (controller.dictionary == null)
                return Container();
              else
                return Text(controller.dictionary!.word.toString());
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ControlledWidgetBuilder<HomeController>(
                  builder: (context, controller) {
                return TextButton(
                  onPressed: () {
                    controller.getWord("elma");
                  },
                  child: Text("Elma"),
                );
              }),
              ControlledWidgetBuilder<HomeController>(
                builder: (context, controller) {
                  return TextButton(
                    onPressed: () {
                      controller.getWord('armut');
                    },
                    child: Text('Armut'),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
