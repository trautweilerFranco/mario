import wollok.game.*
import mario.*
import obstaculos.*
import enemigoPrincipal.*

object tablero {
	
	method configuraciones(){
		game.title("juego")
		game.boardGround("fondo.png")
		game.cellSize(60)
		game.height(15)
		game.width(25)	
		mario.agregarAMario()
		game.addVisual(new Fantasma())
		game.addVisual(new Cubo())
		enemigoPrincipal.agregarEnemigo()
	}
	
	// hacer el inicio del juego, que ni idea como es eso, menu principal, nombre juego
}
