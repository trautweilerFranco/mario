import mario.*
import wollok.game.*
import objetos.*
import movimiento.*

object nivel {

	method configurete() {
		// LIMITES DEL JUEGO
		game.title("GameSpace")
		game.height(15)
		game.width(25)
		game.boardGround("fondo2.jpg")
			// VISUALES
		self.agregarObjetos()
		game.addVisual(mario)
		game.whenCollideDo(mario, { arma => arma.colisionoCon(mario)})
		moves.config()
		collides.config()
	}
	method agregarObjetos() {
		game.schedule(20000, {game.removeTickEvent("agregar fantasmas")})
		game.onTick(4000, "agregar fantasmas", {game.addVisual(new Fantasma())})
		game.onTick(4000, "agregar fantasmas", {game.addVisual(new Bomba())})
		game.onTick(4000, "agregar fantasmas", {game.addVisual(new Hongo())})
		game.addVisual(new Cubo())
		game.addVisual(new Tubo())
	}
}
	