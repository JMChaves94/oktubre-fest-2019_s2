import marcas.*
import jarras.*
import personas.*

class Carpa {
	var property limiteDeAdmision = 0
	var property tieneBanda = true
	var property marcaAVender
	var property personasDentro = #{}
	
	
	
	
	method personaPuedeEntrar(persona) = self.limiteDeAdmision() > self.cantPersonasDentro() 
			and not persona.estaEbrio()
			
	
	method cantPersonasDentro() = personasDentro.size()
	
	
	method ingresarACarpa(persona) {
		
		if(persona.puedeEntrar(self))
		{
			personasDentro.add(persona)
		}
		else
		{
			self.error("No entra")
		}
		}
		
	method servirJarra(persona, capacidad) {
		
		const jarra = new Jarra(litros = capacidad, marca = self.marcaAVender())
		if (personasDentro.contains(persona)) 
		{
			persona.comprarJarra(jarra)
		}
		else 
		{ 
			self.error("No se encuentra en esta carpa")
		} 
	}
	
	
	method contEbrioEmpedernido() = personasDentro.count({c => c.esEbrioEmpedernido()})
	
	
}
		

