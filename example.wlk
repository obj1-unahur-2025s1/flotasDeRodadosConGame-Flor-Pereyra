/*
object corsa1 {
  var property color = "rojo"
  method capacidad() = 4
  method velocidadMaxima() = 150
  method peso() = 130
}

object corsa2 {
  var property color = "verde"
  method capacidad() = 4
  method velocidadMaxima() = 150
  method peso() = 130
}

object corsa3 {
  var property color = "verde"
  method capacidad() = 4
  method velocidadMaxima() = 150
  method peso() = 130
}
*/

//en lugar de hacer tantos objetos igual con pocas diferencias hago clases del mismo objeto
import wollok.game
class Corsa {
  var position = new Position(x=4,y=7) //game.at(0,0) (otra forma)
  var property color 
  const pasoPor = []
  method capacidad() = 4
  method velocidadMaxima() = 150
  method peso() = 1300
  method position(nuevaPosicion) = 
}

class Kwid {
  var property tieneTanqueAdicional 
  method capacidad() = if(tieneTanqueAdicional) 3 else 4
  method velocidadMaxima() = if(tieneTanqueAdicional) 110 else 120
  method peso() = 1200 + if(tieneTanqueAdicional) 150 else 0
  method color() = "azul"
}

object trafic {
  var interior = comodo
  var motor = pulenta
  method capacidad() = interior.capacidad()
  method velocidadMaxima() = motor.velocidad()
  method peso() = 4000 + interior.peso() + motor.peso()
  method color() = "blanco"
}

class AutosEspeciales {
  var property capacidad
  var property peso
  var property color
  const velocidadMaxima
  method velocidadMaxima() =
    velocidadMaxima.min(topeVelocidadMaxima.tope())
}

object topeVelocidadMaxima {
  var property tope = 200 
}

object pulenta {
  method peso() = 800
  method velocidad() = 130
}

object bataton {
  method peso() = 500
  method velocidad() = 80
}

object comodo {
  method capacidad() = 5
  method peso() = 700
}

object popular {
  method capacidad() = 12
  method peso() = 1000
}

//pruebas 
//const especial1 = new AutosEspeciales(capacidad=4,peso=1500,velocidadMaxima=210,color="verde")
//const especial2 = new AutosEspeciales(capacidad=4,peso=1500,velocidadMaxima=180,color="azul")


class Dependencia {
  const flota = []
  var property cantidadEmpleados = 0
  method agregarFlota(rodado) {flota.add(rodado)}
  method quitarFlota(rodado) {flota.remove(rodado)}
  method pesoTotalFlota() = flota.sum{{r=>r.peso()}}
  method estaBienEquipada() = 
  self.tieneAlMenosRodados(3) && self.todosVanAlMenosA100()
  method tieneAlMenosRodados(cantidad) = flota.size() > 2
  method todosVanAlMenosA100() = flota.all({r=>r.velocidadMaxima()>=100})
  method capacidadTotalEnColor(color) =
  self.rodadosDeColor(color).sum({r=>r.capacidad()})
  method rodadosDeColor(color) = flota.filter({r=>r.color() == color})
  method colorDelRodadoMasRapido() = self.rodadoMasRapido().color()
  method rodadoMasRapido() = flota.max({r=>r.velocidadMaxima()})
  method capacidadFaltante() = (cantidadEmpleados - self.capacidadDeLaFlota()).max(0)
  method capacidadDeLaFlota() = flota.sum({r=>r.capacidad()})
  method esGrande() = cantidadEmpleados >= 40 && self.tieneAlMenosRodados(5)
}
