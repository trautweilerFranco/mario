import mario.*
import wollok.game.*
import objetos.*
import movimiento.*

object nivel {

	method inicio() {
		// LIMITES DEL JUEGO
		game.title("El Fontanero")
		game.addVisual(introJuego)	
		game.height(15)
		game.width(25)
		keyboard.enter().onPressDo{self.juego()}
	}
	
	method juego(){
		game.clear()
		game.boardGround("fondo2.jpg")
		game.addVisual(mario)
		game.showAttributes(mario) 
			// configuracion mov y colides
		moves.config()
		collides.config()
		game.whenCollideDo(mario, { arma => arma.colisionoCon(mario)})
			// agregar objetos
		self.agregarObjetos()
	}
	
	method agregarObjetos() {
		game.schedule(20000, {game.removeTickEvent("agregar fantasmas")})
		game.onTick(5000, "agregar fantasmas", {game.addVisual(new Fantasma())})
		game.onTick(5000, "agregar fantasmas", {game.addVisual(new Bomba(position = pos.posicionAleatoria()))})
		game.onTick(5000, "agregar fantasmas", {game.addVisual(new Hongo())})
		game.addVisual(new Cubo())
		game.addVisual(new Tubo(position = game.at(6,3)))
		game.addVisual(new Tubo(position = game.at(12,3)))
		game.addVisual(new Tubo(position = game.at(17,3)))
	}
}
	

object introJuego{
	var property position = game.at(0,0)
	var property image = "imagenInicio.jpg"
}