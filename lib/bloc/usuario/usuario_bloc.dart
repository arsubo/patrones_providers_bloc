import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:estados_app/models/usuario.dart';

part 'usuario_state.dart';
part 'usuario_event.dart';

class UsuarioBloc extends Bloc<UsuarioEvent, UsuarioState> {
  UsuarioBloc() : super(UsuarioState());

//el async* es una función generadora en lugar de un future retorna un stream
  @override
  Stream<UsuarioState> mapEventToState(UsuarioEvent event) async* {
    // recibe un evento y cambia el estado
    if (event is ActivarUsuario) {
      //como emite un stream se dene usar yield
      yield state.copyWith(event.usuario);
    } else if (event is CambiarEdad) {
      yield state.copyWith(state.usuario.copyWith(edad: event.edad));
    } else if (event is AgregarProfesion) {
      final List<String> profesiones = state.usuario.profesiones;
      profesiones.add('Profesion ${profesiones.length + 1}');

      yield state.copyWith(state.usuario.copyWith(profesiones: profesiones));
    } else if (event is BorrarUsuario) {
      //al no pasar usaurio simplemente borra todo
      yield state.estadoInicial();
    }
  }
}
