import wollok.game.*
import mario.*

class Bomba {
	
	var property position = pos.posicionAleatoria()
	
	var property vitalidad = 100
	
	method image() = "bomba.png"
	
	method colisionoCon(objetoVolador){
   
      game.say(objetoVolador," bomba econtrada " + " vitalidad : " + self.vitalidad().toString())
      game.removeVisual(self)
     }
}

class Fantasma {
	
	var property position = pos.posicionAleatoria()
	
	var property vitalidad = 50
	
	method image() = "fantasma.png"
	
	method colisionoCon(objetoVolador){
     game.say(objetoVolador,"fantasma encontrado " + " alcance : " + self.vitalidad().toString())
     game.removeVisual(self)
     }
}
          
class Cubo {
	
	var property position = game.at(12,6)
	
	var property vitalidad = 100
	
	method image() = "cubo.png"
	
	method colisionoCon(personaje){
	   return if(position == personaje.position()){
	   	game.removeVisual(self)
	   	game.clear()
	   	game.addVisualCharacter(personaje)	
	   	game.addVisual(browser)
	   	muros.armarTablero()
	    personaje.position(game.at(1,1))
	    personaje.vitalidad(){vitalidad = 0}  
	    game.onTick(100,"trampa",{game.say(browser,"Caiste en una trampa")})         
	           }
	           else{
	           	
	           }  
	}
}  
    
object browser{
  	
   var property position = game.at(11,11)
  
   method image() = "enemigo.png"
}

class Bloque{
	var property position	
	var property image = "bloque.png"	
	var property esAtravesable = false
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
	
	method colisionar(){
	}
}































object pos {
	method posicionAleatoria(){
		return game.at(1.randomUpTo(game.width()-1),
			1.randomUpTo(game.height()-1) 		
			)
		

	}
}