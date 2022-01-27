
import 'package:rxdart/rxdart.dart';
class LoginViewModel{
  final _emailSubject=BehaviorSubject<String>();
  final _passSubject=BehaviorSubject<String>();
  final _btnSubject=BehaviorSubject<String>();

  Stream<String> get emailStream=>_emailSubject.stream;
  Stream<String> get passStream=>_passSubject.stream;

  ValueStream<String> get btnStream=>_btnSubject.stream;
  LoginViewModel(){

  }

  dispose(){
    _emailSubject.close();
    _passSubject.close();
    _btnSubject.close();
  }
}