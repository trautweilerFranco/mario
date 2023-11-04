import wollok.game.*

object enemigoPrincipal{
	
	var property position = new Position(x = 11, y = 11) 

	method image() = "enemigo.png"
	
	method agregarEnemigo(){
		game.addVisual(self)
	}
	
	// generarle movimiento en una sola franja
	
	// que dispare
	
	// que muera
	
	// limitarle la cantidad de bombas que puede tirar
	
	
}
