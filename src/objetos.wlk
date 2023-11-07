import wollok.game.*
import mario.*
import sopresa.*
import nivel.*
import movimiento.*

// aca se deberia haber hecho una clase madre objetos, y todos herederos. no me salio nunca que me ande

class Bomba {
	
	var property position = pos.posicionAleatoria()
	
	const property esEnemigo = true
	
	const property danio = 50
	
	const property vitalidad = 0
	
	method image() = "bomba.png"
	
	method colisionoCon(personaje){
		personaje.colisionoConObjeto(self)
   		game.say(personaje,"mi vitalidad bajo a" + mario.vitalidad().toString())
   		game.removeVisual(self)
     }
}

class Fantasma {
	
	var property position = pos.posicionAleatoria()
	
	const property danio = 100
	
	const property esEnemigo = true
	
	const property vitalidad = 0

	method image() = "fantasma.png"
	
	method colisionoCon(personaje){
		personaje.colisionoConObjeto(self)
     	game.removeVisual(self)
     	game.say(personaje,"mi vitalidad bajo a" + mario.vitalidad().toString())
     }
}

class Hongo {
	
	var property position = pos.posicionAleatoria()
	
	const property vitalidad = 100
	
	const property esEnemigo = false
	
	const property danio = 0
	
	method image() = "hongo.png"
	
	method colisionoCon(personaje){
		personaje.colisionoConObjeto(self)
		game.say(personaje,"perfecto, busquemos mas")
		game.removeVisual(self) 
     }
}

class Cubo {
	
	var property position
	
	const property esEnemigo = false
	
	method image() = "cubo.png"
	
	method colisionoCon(personaje){
	   	sorpresa.sorpresa(personaje)    
	}
}  

class BloqueEnemigo {
	
	var property position
	
	const property esEnemigo = false
	
	method image() = "bloqueEnemigo.png"
	
	method colisionoCon(personaje){
	   return 
	   if(personaje.estrellas() == 5 or personaje.marioConsiguioLaVidaSuprema()){
	   	 game.say(browser, "OH NO!")
	   	 game.removeVisual(self)
	   	 personaje.tp(game.at(14,11))
	    }
	  else{
	     game.say(browser, "faltan estrellas")
		}  
	}
}

class Estrella {
	
	var property position
	
	const property vitalidad = 0
	
	const property esEnemigo = false
	
	const property danio = 0
	
	method image() = "estrella.png"
	
	method colisionoCon(personaje){
		personaje.recogerEstrella()
		game.removeVisual(self) 
     }
}

class HongoMalo {
	var property position
	
	const property vitalidad = 0
	
	const property esEnemigo = true
	
	const property danio = 0
	
	method image() = "honguitoMalo.png"
	
	method colisionoCon(personaje){
		nivel.perderEtapa2()
     }
     
	
}

object flor {
	var property position = game.at(11,1)
	
	const property vitalidad = 0
	
	const property esEnemigo = false
	
	const property danio = 0
	
	const property esFlor = true
	
	method image() = "flor.png"
	
	method colisionoCon(personaje){
		game.removeVisual(personaje)
		game.removeVisual(self)
		game.addVisual(marioSupremo)
		moves.configSegundaParte(marioSupremo)
		collides.config(marioSupremo)
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
		const paredesDerrumbables = []
		
		(0 .. ancho).forEach{ n => posParedes.add(new Position(x=n, y=0)) }
		(0 .. largo).forEach{ n => posParedes.add(new Position(x=0, y=n)) }
		(0 .. largo).forEach{ n => posParedes.add(new Position(x=ancho, y=n)) }
	
		[1,2,3,4,5,6,7,8,9,15,16,17,18,19,20,21,22,23].forEach{n => posParedes.add(new Position(x=n, y=14))}
		[6,8,9,15,20].forEach{n => posParedes.add(new Position(x=n, y=13))}
		[2,3,4,6,9,18,22].forEach{n => posParedes.add(new Position(x=n, y=12))}
		[4,5,6,7,9,20].forEach{n => posParedes.add(new Position(x=n, y=11))}
		[2,7,9,10,11,12,13,14,15,16,17,18,19,20,21,22].forEach{n => posParedes.add(new Position(x=n, y=10))}
		[2,3,5,7,9,10,14,18,22].forEach{n => posParedes.add(new Position(x=n, y=9))}
		[2,5,7,10,12,14,16,18,20,22].forEach{n => posParedes.add(new Position(x=n, y=8))}
		[2,4,5,7,8,10,11,12,14,16,18,20,22].forEach{n => posParedes.add(new Position(x=n, y=7))}
		[1,2,4,14,16,20,22].forEach{n => posParedes.add(new Position(x=n, y=6))}
		[4,6,7,8,10,11,12,14,17,18].forEach{n => posParedes.add(new Position(x=n, y=5))}
		[1,2,4,6,8,10,14,15,18,19,20,22].forEach{n => posParedes.add(new Position(x=n, y=4))}
		[2,4,8,10,12,15,16,19,20,22].forEach{n => posParedes.add(new Position(x=n, y=3))}
		[2,4,6,10,12,13,16,17,19,20].forEach{n => posParedes.add(new Position(x=n, y=2))}
		[4,6,8,9,10,12,13,14,19,20,22].forEach{n => posParedes.add(new Position(x=n, y=1))}
		
		[15].forEach{n => paredesDerrumbables.add(new Position(x=n, y=12))}
		[15].forEach{n => paredesDerrumbables.add(new Position(x=n, y=11))}
		
		posParedes.forEach { p => self.dibujar(new Bloque(position = p)) }	
		paredesDerrumbables.forEach { p => self.dibujar(new BloqueEnemigo(position = p)) }	
	}	
	
	method dibujar(dibujo) {
		game.addVisual(dibujo)
	}
	
}

object browser{
  	
  	const property esAtravesable = false
  	
   var property position = game.at(11,11)
  
   method image() = "enemigo.png"
   
   method colisionoCon(personaje){
   		nivel.ganarEtapa2()
   }
}

object pos {
	method posicionAleatoria(){
		return game.at(1.randomUpTo(24),
			3.randomUpTo(7) 		
			)
		

	}
}

