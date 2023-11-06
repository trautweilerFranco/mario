import wollok.game.*
import objetos.*
import movimiento.*

object sorpresa {
	method sorpresa(personaje){
	   	game.clear()
	   	game.addVisual(personaje)
	   	moves.configSegundaParte()	
	   	game.addVisual(browser)
	   	muros.armarTablero()
	    personaje.position(game.at(1,1)) 
	}
	
}


class Bloque{
	var property position	
	var property image = "bloque.png"
}

object muros{
	
	method armarTablero(){
		const ancho = game.width() - 1
		const largo = game.height() - 1
	
		const posParedes = []
		(0 .. ancho).forEach{ n => posParedes.add(new Position(x=n, y=0)) } // bordeAbajo
		(0 .. ancho).forEach{ n => posParedes.add(new Position(x=n, y=largo)) } // bordeArriba 
		(0 .. largo).forEach{ n => posParedes.add(new Position(x=0, y=n)) } // bordeIzq 
		(0 .. largo).forEach{ n => posParedes.add(new Position(x=ancho, y=n)) } // bordeDer
		
		[4,13,19].forEach{n => posParedes.add(new Position(x=n, y=16))}
		[2,3,4,6,7,8,10,11,13,14,15,16,17,19,20,21].forEach{n => posParedes.add(new Position(x=n, y=15))}
		[6,10,17,19,21,22].forEach{n => posParedes.add(new Position(x=n, y=14))}
		[1,2,3,4,5,6,8,9,10,11,12,13,14,16,17,19,21].forEach{n => posParedes.add(new Position(x=n, y=13))}
		[4,8,14,17,19,23].forEach{n => posParedes.add(new Position(x=n, y=12))}
		[2,4,6,7,8,10,11,12,23].forEach{n => posParedes.add(new Position(x=n, y=11))}
		[2,6,10,14,15,16,17,18,19,21,22,23].forEach{n => posParedes.add(new Position(x=n, y=10))}
		[2,3,4,5,6,8,10,12,13,14,17,19,21].forEach{n => posParedes.add(new Position(x=n, y=9))}
		[2,6,7,8,10,13,17,21,23].forEach{n => posParedes.add(new Position(x=n, y=8))}
		[2,4,10,12,13,15,16,17,19,20,21].forEach{n => posParedes.add(new Position(x=n, y=7))}
		[1,2,4,5,6,7,8,9,10,12,17,19,21,22].forEach{n => posParedes.add(new Position(x=n, y=6))}
		[4,6,9,14,15,16,17,19,21].forEach{n => posParedes.add(new Position(x=n, y=5))}
		[1,2,4,6,8,9,11,12,14,19,21,23].forEach{n => posParedes.add(new Position(x=n, y=4))}
		[2,4,9,12,13,14,16,17,18,19,21].forEach{n => posParedes.add(new Position(x=n, y=3))}
		[2,4,7,12,14,18,21].forEach{n => posParedes.add(new Position(x=n, y=2))}
		[6,7,8,10,12,16].forEach{n => posParedes.add(new Position(x=n, y=1))}
		
		posParedes.forEach { p => self.dibujar(new Bloque(position = p)) }	
	}	
	
	method dibujar(dibujo) {
		game.addVisual(dibujo)
	}
	
}