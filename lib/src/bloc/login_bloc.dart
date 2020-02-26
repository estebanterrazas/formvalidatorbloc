
import 'dart:async';

import 'package:formvalidation/src/bloc/validators.dart';

class LoginBloc with Validators{

  final _emailController   = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();

  //Recuperar los datos del stream

  get emailStream    => _emailController.stream.transform(validarEmail);
  get passwordStream => _passwordController.stream.transform(validarPassword);
  
  
  //Insertar valores al stream
  Function(String) get changeEmail    => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  dispose(){
    _emailController?.close();
    _passwordController?.close();


  }
  
}