import wollok.game.*

class Obstaculo {
	
	var property image = null
	var property position = null
	
}


class Cubo inherits Obstaculo(image = "cubo.png",position = new Position(x = 4, y = 5)){
	
	// se deben generar un numero x aleatoriamente en el tablero
	
	// generara las colisiones
}


class Fantasma inherits Obstaculo (image = "fantasma.png", position = new Position(x = 2, y = 3)){
	
	//enemigo del tablero, supongamos que solo se mueve en 3 casillas, de izq a der
		
}

class Frutas inherits Obstaculo{
	
}