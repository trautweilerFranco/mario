import mario.*
import wollok.game.*
import objetos.*

object nivel {

	method configurete() {
		// LIMITES DEL JUEGO
		game.title("GameSpace")
		game.height(15)
		game.width(25)
			// FONDO
		game.boardGround("fondo.png")
			// VISUALES
		self.agregarObjetos()
		game.addVisual(new Cubo())
		// Por defecto sirve para que el objeto nave se mueva con la teclas arriba/abajo/izq/der y no se vaya del tablero.
		//Si queres que más objetos se muevan ,no sirve porque todos se van a mover con las mismas teclas.
		game.addVisualCharacter(mario)
		game.whenCollideDo(mario, { arma => arma.colisionoCon(mario)})
	}
	method agregarObjetos() {
		game.schedule(20000, {game.removeTickEvent("agregar fantasmas")})
		game.onTick(1500, "agregar fantasmas", {game.addVisual(new Fantasma())})
		game.onTick(1500, "agregar fantasmas", {game.addVisual(new Bomba())})
	}
}
	