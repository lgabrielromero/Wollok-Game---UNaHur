import wollok.game.*
import personajes.*
import nivel1.*
import direcciones.*


////////////////////
///////LLAVE////////
////////////////////

class Llave {
	var property position
	const property image = "Key.png" 	
	
	method colisionAccion(){
		player.agarrarLlave()
		game.removeVisual(self)
	}
}



////////////////////
//////MONEDA////////
////////////////////

class Moneda {
	var property position
	const property image = "Coin.png"
	method colisionAccion(){
		player.agarrarMoneda()
		game.removeVisual(self)
	}
}



////////////////////
//////PUERTA////////
////////////////////

class Puerta {
	var property position
	const property image = "Door.png"
	
	method colisionAccion(){
		if (player.llaves() == 3){
			nivelBloques.terminar()
		}
		else{
			game.say(player, "Necesito las 3 llaves!")
		}
	}
}



////////////////////
//////BARRIL////////
////////////////////

class Barril {
	var property position
	const property image = "Barril.png"
	var property esAtravesable = false
	method validarLugarLibre(direccion){
		const alLado = direccion.siguiente(position)
		return game.getObjectsIn(alLado).all{ obj => obj.esAtravesable()}
		
	}
	method movete(direccion){
		if(self.validarLugarLibre(direccion)){
			position = direccion.siguiente(position)
		}
		
	}
	method colisionAccion(){
		
		self.movete(player.direccion())
	}
	
}


