import carpas.*
import marcas.*
import jarras.*

class Persona {
	var property peso = 0
	var property jarrasCompradas = []
	var property nivelDeAguante = 0
	var property leGustaMusicTrad = true
	var property nacionalidad
	
	method setNacionalidad(unaNacionalidad) { self.nacionalidad(unaNacionalidad) }
	
	method comprarJarra(unaJarra) {jarrasCompradas.add(unaJarra)}  
	
	method alcoholConsumido() = jarrasCompradas.sum({jarra => jarra.contenidoDeAlcohol()})
	
	method estaEbrio() = self.alcoholConsumido() * self.peso() > self.nivelDeAguante()
	
	
	method leGusta(cerveza) = true
	
	method personaQuiereEntrar(carpa) = self.leGusta(carpa.marcaAVender()) and 
	(self.leGustaMusicTrad() == carpa.tieneBanda()) 
	
	
	method puedeEntrar(carpa) = carpa.personaPuedeEntrar(self) and 
			self.personaQuiereEntrar(carpa)
	
	
	
	method esEbrioEmpedernido() = jarrasCompradas.all({jarra => jarra.litros() >= 1})
	
		
	method esPatriota() = jarrasCompradas.all({jarra => jarra.marca().paisDeOrigen() == self.nacionalidad()})
}


class Belga inherits Persona {
	override method setNacionalidad(unaNacionalidad) { "Belgica" } 
	override method leGusta(cerveza) = cerveza.lupulo() > 4
}

class Checo inherits Persona {
	override method setNacionalidad(unaNacionalidad) { "Republica Checa" } 
	override method leGusta(cerveza) = cerveza.graduacion() > 0.08 
}

class Aleman inherits Persona {
	override method setNacionalidad(unaNacionalidad) { "Alemania" } 
	override method personaQuiereEntrar(carpa) = super(carpa) and 
		carpa.cantPersonasDentro().even()
}


