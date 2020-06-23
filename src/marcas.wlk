class Cerveza {
	var property lupulo = 0
	var property paisDeOrigen 
	
		
}

class Rubia inherits Cerveza {
	var property graduacion = 0
	
	
}

class Negra inherits Cerveza {
	
	method graduacion() = graduacionReglamentaria.graduacionMundial().min(self.lupulo() * 2) 
}


class Roja inherits Negra {
	
	override method graduacion() = super() * 1.25
}

object graduacionReglamentaria {
	var property graduacionMundial = 0
}



