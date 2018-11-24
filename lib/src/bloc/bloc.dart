import 'dart:async';
import 'validator.dart';
import 'package:rxdart/rxdart.dart';
class Bloc extends Object with Validator{
  final _name = BehaviorSubject<String>();
  final _title = BehaviorSubject<String>();
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  Stream<String> get nameStream => _name.stream.transform(validateName);
  Stream<String> get titleStream => _title.stream.transform(validateTitle);
  Stream<String> get emailStream => _email.stream.transform(validateEmail);
  Stream<String> get passwordStream => _password.stream.transform(validatePassword);
  Stream<bool> get submitValid => Observable.combineLatest4(nameStream,
      titleStream, emailStream, passwordStream, (a, b, c, d)=> true);

  Function(String) get changeName => _name.sink.add;
  Function(String) get changeTitle => _title.sink.add;
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  submit(){
    return 'Hello ${_name.value} aka ${_title.value}';
  }


  dispose() {
    _name.close();
    _title.close();
    _email.close();
    _password.close();
  }

}