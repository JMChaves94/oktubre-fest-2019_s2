import marcas.*

class Jarra {
	var property litros = 0
	var property marca
	
	
	method contenidoDeAlcohol() = self.litros() * marca.graduacion() 
	
	method paisDeOrigen()
	{
		return marca.paisDeOrigen()
	}
}
