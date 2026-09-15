object knightRider {
  method peso() = 500
  method peligrosidad() = 10
  method bultos() = 1
}

object bumblebee {
  const peso = 800
  var esRobot = true

  method esRobot(unBooleano) {
    esRobot = unBooleano
  }

  method peso() = peso

  method peligrosidad() {
    if (esRobot) {
      return 30
    }
    return 15
  }

  method bultos() = 2
}

object paqueteDeLadrillos {
  const peligrosidad = 2
  var ladrillos = 0

  method ladrillos(unaCantidad) {
    ladrillos = unaCantidad
  }

  method peso() = ladrillos * 2
  method peligrosidad() = peligrosidad

  method bultos() {
    if (ladrillos <= 100) {
      return 1
    }
    if (ladrillos <= 300) {
      return 2
    }
    return 3
  }
}

object arenaAGranel {
  var peso = 0
  const peligrosidad = 1

  method peso(unPeso) {
    peso = unPeso
  }

  method peso() = peso
  method peligrosidad() = peligrosidad
  method bultos() = 1
}

object bateriaAntiaerea {
  var hayMisiles = true

  method cargarMisiles(unBooleano) {
    hayMisiles = unBooleano
  }

  method peso() {
    if (hayMisiles) {
      return 300
    }
    return 200
  }

  method peligrosidad() {
    if (hayMisiles) {
      return 100
    }
    return 0
  }

  method bultos() {
    if (hayMisiles) {
      return 2
    }
    return 1
  }
}

object residuosRadioactivos {
  var peso = 0
  const peligrosidad = 200

  method peso(unPeso) {
    peso = unPeso
  }

  method peso() = peso
  method peligrosidad() = peligrosidad
  method bultos() = 1
}

object contenedorPortuario {
  const cosasDentro = []

  method agregarCosa(unaCosa) {
    cosasDentro.add(unaCosa)
  }

  method peso() = 100 + cosasDentro.sum({ unaCosa => unaCosa.peso() })

  method peligrosidad() {
    if (cosasDentro.isEmpty()) {
      return 0
    }
    return cosasDentro.max({ unaCosa => unaCosa.peligrosidad() }).peligrosidad()
  }

  method bultos() = 1 + cosasDentro.sum({ unaCosa => unaCosa.bultos() })
}

object embalajeDeSeguridad {
  var cosaEnvolviendo = knightRider

  method envolver(unaCosa) {
    cosaEnvolviendo = unaCosa
  }

  method peso() = cosaEnvolviendo.peso()

  method peligrosidad() = cosaEnvolviendo.peligrosidad() / 2

  method bultos() = 2
}