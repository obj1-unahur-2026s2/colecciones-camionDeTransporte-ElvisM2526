object camion {
  var cosas = []
  const tara = 1000

  // 1. Cargar y descargar cosas, y peso total del camión
  method cargar(unaCosa) {
    cosas.add(unaCosa)
  }

  method descargar(unaCosa) {
    cosas.remove(unaCosa)
  }

  method peso() {
    return tara + cosas.sum({ unaCosa => unaCosa.peso() })
  }

  // 2. Conocer si los pesos de todas las cosas cargadas son números pares
  method elPesoDeTodosEsPar() {
    return cosas.all({ unaCosa => unaCosa.peso().even() })
  }

  // 3. Consultar si hay alguna cosa que pesa un determinado valor
  method hayPesoDe(valor) {
    return cosas.any({ unaCosa => unaCosa.peso() == valor })
  }

  // 4. Obtener la primer cosa cargada que tenga un determinado nivel de peligrosidad
  method primeraCosaConPeligrosidad(unNivel) {
    return cosas.find({ unaCosa => unaCosa.peligrosidad() == unNivel })
  }

  // 5. Obtener todas las cosas que superan un determinado nivel de peligrosidad
  method cosasConPeligrosidadMayorA(unNivel) {
    return cosas.filter({ unaCosa => unaCosa.peligrosidad() > unNivel })
  }

  // 6. Consultar la lista de cosas que superan el nivel de peligrosidad de una cosa dada
  method cosasQueSuperanPeligrosidadDe(unaCosa) {
    return self.cosasConPeligrosidadMayorA(unaCosa.peligrosidad())
  }

  // 7. Conocer si el camión está excedido del peso máximo permitido (2500 kg)
  method estaSobrecargado() {
    return self.peso() > 2500
  }

  // 8. Saber si el camión puede circular en ruta
  method puedeCircularEnRuta(nivelMaximoPeligro) {
    return not self.estaSobrecargado() and cosas.all({ cosa => cosa.peligrosidad() <= nivelMaximoPeligro })
  }

  // AGREGADOS AL CAMIÓN
  // a. Consultar si tiene alguna cosa que pesa entre un valor mínimo y un valor máximo
  method tieneAlgoQuePesaEntre(min, max) {
    return cosas.any({ cosa => cosa.peso().between(min, max) })
  }

  // b. La cosa más pesada que tiene cargada
  method cosaMasPesada() {
    return cosas.max({ cosa => cosa.peso() })
  }
}