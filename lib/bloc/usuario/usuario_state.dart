part of 'usuario_cubit.dart';

@immutable
abstract class UsuarioState {}

class UsuarioInit extends UsuarioState {
  //aqui se definen los valores iniciales
  final existeUsuario = false;
}

class UsuarioActivo extends UsuarioState {
  final existeUsuario = true;
  final Usuario usuario;

  UsuarioActivo(this.usuario);


}
