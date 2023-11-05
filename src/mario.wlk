import wollok.game.*
import objetos.*

object mario {
	
	//var vidas = 5
	 
	 var  property vitalidad = 20
	 
	 var property position = game.origin()
	 
	 method image() = "mario.png"
	
     method irA(nuevaPosicion) {
      return if (self.noTengoVialidad()){
	        self.viaja(position.distance(nuevaPosicion))
	        position = nuevaPosicion
      }
            else{
      	        //FALTA PONERLE TIEMPO PARA VER EL MENSAJE ANTES DE QUE CIERRE
            game.onTick(100,"vidas",{game.say(self,"Te quedaste vidas")})
     
            game.onTick(2000,"vidas",{game.stop()})
           }
      }
     
      method viaja(distancia) {
	   vitalidad = vitalidad - distancia
      }

      method noTengoVialidad(){
	   return vitalidad>0
      }  
}