import 'package:flutter/material.dart';
import '../controllers/implementations/sign_in_controller_impl.dart';

class SignInView extends View {
  static get routeName => '/SignIn'
  final SignInControllerImpl controllerImpl;

  @override
  _SignInViewState generateState() => _SignInViewState(controllerImpl);
}

class _SignInViewState extends ViewState<SignInView, SignInControllerImpl> {

  _SignInViewState(SignInControllerImpl controllerImpl) : super(controllerImpl);

  @override
  void initState() {
  super.initState();
  }

  @override
  Widget buildPage() {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      key: globalKey,
      body: Center(child:Text('Generated by flugen.'))
    )
  }
}

    