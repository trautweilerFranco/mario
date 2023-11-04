import wollok.game.*

object mario {
	var property position = game.at(1,1)

	method image() = "mario.png"
	
	method agregarAMario(){
		game.addVisualCharacter(self)
	}
	
	// vidas
	// puntos
	// tocas fantasma
	// agarrar las frutas
	// tocar enemigo principal
	// que reciba un disparo
	// poder abrir la puerta para el final
	// algun texto cuando recoja algo
	// muerte
	
}