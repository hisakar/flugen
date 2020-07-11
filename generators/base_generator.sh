#!/bin/bash

source paths.sh

function generate_base_files()
{
    generate_base_controller
    generate_base_response
    generate_base_view
}

function generate_base_controller()
{

echo 'import "package:flutter/material.dart";

abstract class Controller extends ChangeNotifier {
  GlobalKey<ScaffoldState> globalKey;
  bool _isMounted;

  @mustCallSuper
  Controller() {
    _isMounted = true;
    initListeners();
  }

  @protected
  void initListeners();

  @protected
  void refreshUI() {
    if (_isMounted) {
      notifyListeners();
    }
  }

  @mustCallSuper
  void dispose() {
    _isMounted = false;
    super.dispose();
  }

  @protected
  State<StatefulWidget> getState() {

    return globalKey.currentState;
  }

  /// Retrieves the [GlobalKey<State<StatefulWidget>>] associated with the [View]
  @protected
  GlobalKey<State<StatefulWidget>> getStateKey() {

    return globalKey;
  }

  /// Initializes optional [Controller] variables that can be used for _refreshing and error displaying.
  /// This method is called automatically by the mounted `View`. Do not call.
  void initController(GlobalKey<State<StatefulWidget>> key) {
    globalKey = key;
  }

  /// Retrieves the [BuildContext] associated with the `View`. Will throw an error if initController() was not called prior.
  @protected
  BuildContext get getContext {

    return globalKey.currentContext;
  }

}
'>"$BASE_DIR/controller.dart"
}


function generate_base_response()
{
    echo 'class Response<T> {
  final Result result;

  Response.success({String message, T data})
      : result = Success<T>(data, message);

  Response.error({String message})
      : result = Error(message);
}

class Success<T> extends Result<T> {
  final Status status = Status.Success;
  Success(T data, String message) : super(data, message, Status.Success);
}

class Error extends Result {
  final Status status = Status.Error;
  Error(String message) : super.justMessage(message, Status.Error);
}

class Result<T> {
  final Status status;
  final T data;
  final String message;

  Result(this.data, this.message, this.status);
  Result.justMessage(this.message, this.status) : data = null;
}

enum Status { Success, Error }
'>"$BASE_DIR/response.dart"
}

function generate_base_view()
{
    echo 'import "package:flutter/material.dart";
import "package:meta/meta.dart";
import "package:provider/provider.dart";

import "controller.dart";

abstract class ViewState<Page extends View, Con extends Controller>
    extends State<Page> {
  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
  Con _controller;
  Con get controller => _controller;
  ViewState(this._controller) {
    _controller.initController(globalKey);
  }

  Widget buildPage();

  @override
  @nonVirtual
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Con>.value(
        value: _controller,
        child: Consumer<Con>(builder: (ctx, con, _) {
          _controller = con;
          return buildPage();
        }));
  }

  @override
  @mustCallSuper
  void dispose() {
    super.dispose();
  }
}

abstract class View extends StatefulWidget {
  final Key key;
  View({this.key}) : super(key: key);
}
'>"$BASE_DIR/view.dart"
}