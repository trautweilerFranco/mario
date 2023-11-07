import wollok.game.*
import objetos.*
import nivel.*


// no me logro salir que los objetos sean instancias y clases, se me rompia el programa


object mario {
	
	var vidas = 5
	 
	var vitalidad = 300
	 
	var estrellas = 0
	
	const property marioConsiguioLaVidaSuprema = false
	 
	var property position = game.at(3,3)
	
	method estrellas() = estrellas
	
	method recogerEstrella(){
		estrellas ++
	}
	 
	method tp(unaPos){
		position = unaPos
	} 
	
	////////////////////////////////////////////////////////////////////////////
	//el código asegura que el objeto se moverá a la nueva posición
	//solo si la nueva posición está dentro de los límites del mapa 
	//y si el objeto puede moverse en la dirección especificada. 
	//Si alguna de estas condiciones no se cumple, el objeto no se moverá. 
	
	method move(newPos, direccion) {
		if (self.staysOnMap(newPos) && self.canMove(direccion)) {
			self.position(newPos)
		}
	}
	method staysOnMap(newPos) = return newPos.x() >= 0 && newPos.x() < 24 && newPos.y() >= 0 && newPos.y() < 24
	method canMove(direccion) = return !direccion.contains(self.position().toString())
	
	/////////////////////////////////////////////////////////////////////////// 
	
	method vitalidad() = vitalidad
	 
	 method colisionoConObjeto(unObjeto){
	 	if(unObjeto.esEnemigo()){
	 		self.chocoConUnEnemigo(unObjeto)
	 	} else {
	 		self.chocoConUnHongo(unObjeto)
	 		}
	 }
	 
	 method chocoConUnEnemigo(unObjeto){
	 		vitalidad = 0.max(vitalidad - unObjeto.danio())
	 		vidas --
	 		game.say(self,"mi vitalidad bajo a" + self.vitalidad().toString())
	 		self.puedeSeguirViviendoMario()
	 }
	 
	 method chocoConUnHongo(unObjeto){
	 		vitalidad = 1000.min(vitalidad + unObjeto.vitalidad())
	 		vidas = vidas + 1
	 		game.say(self,"perfecto, busquemos mas")
	 		self.ganarPorCantidad()
	 		self.marioConsiguioLaVidaSuprema()
	 }
	 
	 method puedeSeguirViviendoMario(){
	 	if(vidas == 0 or vitalidad == 0){
	 		game.onTick(5000, "muerte",{game.say(self,"No tengo nada para sobrevivir")})
	 		game.onTick(8000, "muerte",{nivel.perderEtapa1()})
	 	}
	 }
	 
	 method ganarPorCantidad(){
	 	if (vidas == 8 or vitalidad == 1200){
	 		game.onTick(1000, "ganar",{game.say(self,"HE GANADO!")})
	 		game.onTick(8000, "ganar",{nivel.ganarEtapa1()})
	 	}
	 }
	 

	 
	 
	 method image() = "mario.png"
}


object marioSupremo {
	 
	var estrellas = 0
	
	const vitalidad = 0
	
	var tieneFlor = false
	 
	var property position = game.at(11,1)
	
	method vitalidad() = vitalidad
	
	method image() = "marioBlanco.png"
	
	method estrellas() = estrellas
	
	method recogerEstrella(){
		estrellas ++
	}
	 
	method tp(unaPos){
		position = unaPos
	} 
	 
	method move(newPos, direccion) {
		if (self.staysOnMap(newPos) && self.canMove(direccion)) {
			self.position(newPos)
		}
	}

	method staysOnMap(newPos) = return newPos.x() >= 0 && newPos.x() < 24 && newPos.y() >= 0 && newPos.y() < 24
	
	method canMove(direccion) = return !direccion.contains(self.position().toString())

	 method colisionoConObjeto(unObjeto){
	 	if(unObjeto.esEnemigo()){
	 		self.chocoConUnEnemigo(unObjeto)
	 	} else {
	 		self.chocoConUnaEstrellaOFlor(unObjeto)
	 		}
	 }
	 
	 method chocoConUnEnemigo(unObjeto){
	 	game.onTick(100, "muerte",{nivel.perderEtapa2()})
	 }
	 
	 method chocoConUnaEstrellaOFlor(unObjeto){
	 	if(unObjeto.esFlor()){
	 		tieneFlor = true
	 	}
	 }
	 method marioConsiguioLaVidaSuprema() = true
}
