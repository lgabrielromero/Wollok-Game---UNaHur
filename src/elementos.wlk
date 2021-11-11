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

////////////////////////////////////
////comida y bebida, dan energía////
///////////////////////////////////

class ComidaYBebida{
	var property energiaQueAporta
	var property image
    var property position = game.at(0.randomUpTo(game.width() - 1),0.randomUpTo(game.height() - 1))

    method colisionAccion(){
    	player.comer(self)
    	game.removeVisual(self)
    }
}

const Ham1 = new ComidaYBebida(energiaQueAporta=20,image = "HAM.png")
const Coquita1 = new ComidaYBebida(energiaQueAporta=5,image = "Coquita.png")
const Ham2 = new ComidaYBebida(energiaQueAporta=20,image = "HAM.png")
const Coquita2 = new ComidaYBebida(energiaQueAporta=5,image = "Coquita.png")
const Ham3 = new ComidaYBebida(energiaQueAporta=20,image = "HAM.png")
const Coquita3 = new ComidaYBebida(energiaQueAporta=5,image = "Coquita.png")




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


