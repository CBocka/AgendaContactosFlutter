import 'package:agenda/models/contacto.class.dart';
import 'package:flutter/material.dart';

class Agenda extends ChangeNotifier {
  List<Contacto> contactos = [];

  List<String> etiquetasFiltro = [];
  List<String> etiquetasFiltroTotales = [];

  Agenda() {
    contactos = generarListaEjemplo();
    etiquetasFiltro = listaEtiquetas();
    etiquetasFiltroTotales = obtenerEtiquetasFiltro();
  }

  List<Contacto> generarListaEjemplo() {
    return [
      Contacto(
        nombre: 'Juan',
        apellido: 'Perez',
        email: 'juan@example.com',
        telefono: '634567890',
        nacimiento: '1990-05-15',
        etiquetas: ['amigo', 'trabajo'],
      ),
      Contacto(
        nombre: 'Maria',
        apellido: 'Gomez',
        email: 'maria@example.com',
        telefono: '655432109',
        nacimiento: '1985-08-25',
        etiquetas: [""],
      ),
      Contacto(
        nombre: 'Luis',
        apellido: 'Martinez',
        email: 'luis@example.com',
        telefono: '677890123',
        nacimiento: '1988-10-12',
        etiquetas: ['amigo', 'trabajo'],
      ),
      Contacto(
        nombre: 'Ana',
        apellido: 'Rodriguez',
        email: 'ana@example.com',
        telefono: '612345678',
        nacimiento: '1992-03-20',
        etiquetas: ['amigo', 'personal'],
      ),
      Contacto(
        nombre: 'Carlos',
        apellido: 'Lopez',
        email: 'carlos@example.com',
        telefono: '699012345',
        nacimiento: '1979-12-05',
        etiquetas: ['familia', 'trabajo'],
      ),
      Contacto(
        nombre: 'Sofia',
        apellido: 'Hernandez',
        email: 'sofia@example.com',
        telefono: '688765432',
        nacimiento: '1995-07-18',
        etiquetas: ['personal', 'trabajo'],
      ),
      Contacto(
        nombre: 'Pedro',
        apellido: 'Sanchez',
        email: 'pedro@example.com',
        telefono: '666123456',
        nacimiento: '1983-11-30',
        etiquetas: ['amigo', 'familia'],
      ),
      Contacto(
        nombre: 'Laura',
        apellido: 'Diaz',
        email: 'laura@example.com',
        telefono: '644567890',
        nacimiento: '1998-09-10',
        etiquetas: ['trabajo', 'personal'],
      ),
      Contacto(
        nombre: 'Gabriel',
        apellido: 'Ramirez',
        email: 'gabriel@example.com',
        telefono: '622098765',
        nacimiento: '1980-04-07',
        etiquetas: ['familia', 'amigo'],
      ),
      Contacto(
        nombre: 'Elena',
        apellido: 'Garcia',
        email: 'elena@example.com',
        telefono: '677654321',
        nacimiento: '1991-01-25',
        etiquetas: ['personal', 'trabajo'],
      ),
      Contacto(
        nombre: 'Miguel',
        apellido: 'Fernandez',
        email: 'miguel@example.com',
        telefono: '611234567',
        nacimiento: '1987-06-14',
        etiquetas: ['amigo', 'familia'],
      ),
      Contacto(
        nombre: 'Andrea',
        apellido: 'Torres',
        email: 'andrea@example.com',
        telefono: '699876543',
        nacimiento: '1993-02-28',
        etiquetas: ['trabajo', 'personal'],
      ),
      Contacto(
        nombre: 'Raul',
        apellido: 'Vargas',
        email: 'raul@example.com',
        telefono: '688901234',
        nacimiento: '1986-10-03',
        etiquetas: ['familia', 'amigo'],
      ),
      Contacto(
        nombre: 'Isabel',
        apellido: 'Luna',
        email: 'isabel@example.com',
        telefono: '655678901',
        nacimiento: '1997-11-20',
        etiquetas: ['personal', 'trabajo'],
      ),
      Contacto(
        nombre: 'Hector',
        apellido: 'Ortega',
        email: 'hector@example.com',
        telefono: '633210987',
        nacimiento: '1982-08-07',
        etiquetas: ['amigo', 'familia'],
      ),
      Contacto(
        nombre: 'Monica',
        apellido: 'Soto',
        email: 'monica@example.com',
        telefono: '644789012',
        nacimiento: '1994-05-12',
        etiquetas: ['trabajo', 'personal'],
      ),
      Contacto(
        nombre: 'Diego',
        apellido: 'Mendoza',
        email: 'diego@example.com',
        telefono: '677345678',
        nacimiento: '1989-12-30',
        etiquetas: ['familia', 'amigo'],
      ),
      Contacto(
        nombre: 'Carmen',
        apellido: 'Perez',
        email: 'carmen@example.com',
        telefono: '688789012',
        nacimiento: '1990-09-18',
        etiquetas: [""],
      ),
      Contacto(
        nombre: 'Jorge',
        apellido: 'Gutierrez',
        email: 'jorge@example.com',
        telefono: '633456789',
        nacimiento: '1984-04-25',
        etiquetas: ['amigo', 'familia'],
      ),
      Contacto(
        nombre: 'Raquel',
        apellido: 'Navarro',
        email: 'raquel@example.com',
        telefono: '611234567',
        nacimiento: '1996-07-08',
        etiquetas: ['trabajo', 'personal'],
      ),
      Contacto(
        nombre: 'Antonio',
        apellido: 'Jiménez',
        email: 'antionoje@example.com',
        telefono: '699456789',
        condicion: true,
        nacimiento: '2003-07-08',
        etiquetas: ['amigo', 'trabajo'],
      ),
      Contacto(
        nombre: 'Christian',
        apellido: 'Gaitán',
        email: 'chrisgc@example.com',
        condicion: true,
        telefono: '677890123',
        nacimiento: '2003-10-13',
        etiquetas: ['amigo', 'personal'],
      ),
      Contacto(
        nombre: 'Sara',
        apellido: 'Jimenez',
        email: 'sara@example.com',
        telefono: '688123456',
        nacimiento: '1993-03-22',
        etiquetas: ['amigo', 'personal'],
      ),
      Contacto(
        nombre: 'Roberto',
        apellido: 'Alvarez',
        email: 'roberto@example.com',
        telefono: '644567890',
        nacimiento: '1987-11-10',
        etiquetas: ['trabajo', 'familia'],
      ),
      Contacto(
        nombre: 'Adriana',
        apellido: 'Castillo',
        email: 'adriana@example.com',
        telefono: '655890123',
        nacimiento: '1995-09-15',
        etiquetas: ['personal', 'amigo'],
      ),
      Contacto(
        nombre: 'Hugo',
        apellido: 'Fernandez',
        email: 'hugo@example.com',
        telefono: '633678901',
        nacimiento: '1990-04-05',
        etiquetas: ['familia', 'trabajo'],
      ),
      Contacto(
        nombre: 'Lorena',
        apellido: 'Rojas',
        email: 'lorena@example.com',
        condicion: true,
        telefono: '622345678',
        nacimiento: '1988-08-20',
        etiquetas: ['amigo', 'personal'],
      )
    ];
  }

  void ordenarContactos() {
    contactos.sort((a, b) {
      int comparacionNombre =
          a.nombre.toUpperCase().compareTo(b.nombre.toUpperCase());
      if (comparacionNombre == 0) {
        return a.apellido.compareTo(b.apellido);
      } else {
        return comparacionNombre;
      }
    });

    notifyListeners();
  }

  void eliminarContacto(int id) {
    late Contacto contactoABorrar;

    for (Contacto contacto in contactos) {
      if (contacto.id == id) {
        contactoABorrar = contacto;
      }
    }

    contactos.remove(contactoABorrar);

    notifyListeners();
  }

  List<String> listaEtiquetas() {
    Set<String> etiquetas = {};
    for (Contacto contacto in contactos) {
      etiquetas.addAll(contacto.etiquetas);
    }
    return etiquetas.toList();
  }

  List<String> obtenerEtiquetasFiltro() {
    Set<String> etiquetas = {};
    for (Contacto contacto in contactos) {
      etiquetas.addAll(contacto.etiquetas);
    }

    if (etiquetas.contains("")) {
      etiquetas.remove("");
    }

    return etiquetas.toList();
  }

  void actualizarFiltro(String etiqueta, bool activado) {
    if (activado) {
      etiquetasFiltro.add(etiqueta);
    } else {
      etiquetasFiltro.remove(etiqueta);
    }
    notifyListeners();
  }

  void notificar() {
    notifyListeners();
  }
}
