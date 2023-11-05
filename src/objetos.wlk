import wollok.game.*
import mario.*
import sorpresa.*

class Bomba {
	
	var position
	
	const property esEnemigo = true
	
	const property danio = 100
	
	const property vitalidad = 0
	
	method position(unaPosicion){position = unaPosicion}
	
	method aparece() = game.addVisual(self)
	
	method image() = "bomba.png"
	
	method colisionoCon(personaje){
		mario.colisionoConObjeto(self)
   		game.say(personaje,"daño sufrido: " + danio.toString())
   		game.removeVisual(self)
   		game.say(personaje,"mi vitalidad bajo a" + mario.vitalidad().toString())
     }
}

class Fantasma {
	
	var property position = pos.posicionAleatoria()
	
	const property danio = 100
	
	const property esEnemigo = true
	
	const property vitalidad = 0

	method image() = "fantasma.png"
	
	method colisionoCon(personaje){
		mario.colisionoConObjeto(self)
     	game.say(personaje,"daño sufrido:" + danio.toString())
     	game.removeVisual(self)
     	game.say(personaje,"mi vitalidad bajo a" + mario.vitalidad().toString())
     }
}
          
class Cubo {
	
	var property position = game.at(12,11) // solo toma la primer celda del personaje, OJO
	
	const property esEnemigo = false
	
	method image() = "cuboMediano.png"
	
	method colisionoCon(personaje){
	   return if(position == personaje.position()){
	   		sorpresa.sorpresa(personaje,self)
	   		game.boardGround("fondo.png")
	   		game.onTick(100,"trampa",{game.say(browser,"Caiste en una trampa")})         
	           }
	           else{}  
	}
}  

class Hongo {
	
	var property position = pos.posicionAleatoria()
	
	const property vitalidad = 50
	
	method image() = "hongo.png"
	
	method colisionoCon(personaje){
		game.say(personaje,"que bien un hongo")
		game.removeVisual(self) 
     }
}

class Tubo {
	
	var property position
	
	method image() = "Tubo.png"
	
	method colisionoCon(personaje){
     }
}


object browser{
  	
  	const property esAtravesable = false
  	
   var property position = game.at(11,11)
  
   method image() = "enemigo.png"
}

object pos {
	method posicionAleatoria(){
		return game.at(3.randomUpTo(7),
			3.randomUpTo(7) 		
			)
		

	}
}