import wollok.game.*
import personajes.*
import nivel1.*
import direcciones.*


////////////////////
///////LLAVE////////
////////////////////



class Llave {
	var property position
	const property image
	const property tipo = "item" 	
	var property esAtravesable = false
	method colisionAccion(){
		player.agarrarLlave()
		game.removeVisual(self)
	}
	
	method validarLugarLibre(){return true}
}

class LlaveMaestra inherits Llave{
}



////////////////////
//////MONEDA////////
////////////////////

class Moneda {
	var property position
	const property image = "Coin.png"
	const property tipo = "item"
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
	var property image = "Door.png"
	var property esAtravesable = false
	var property contadorDeVisitas = 0
	const property tipo = "deposito"
	
	method validarLugarLibre(){
		return true
	}
	
	method colisionAccion(){
		if (player.llaves() == 3 and self.contadorDeVisitas() == 0){
			contadorDeVisitas +=1
			game.say(player, "Parece que eran las llaves equivocadas!")
			player.position(game.at(player.position().x(),player.position().y()-1))
			game.addVisual(new Llave(image = "Key.png", position=game.at(0.randomUpTo(game.width() - 1),0.randomUpTo(game.height() - 1))))
			game.addVisual(new Llave(image = "Key.png", position=game.at(0.randomUpTo(game.width() - 1),0.randomUpTo(game.height() - 1))))
			game.addVisual(new Llave(image = "Key.png", position=game.at(0.randomUpTo(game.width() - 1),0.randomUpTo(game.height() - 1))))
		}
		if (player.llaves() == 6 and self.contadorDeVisitas() == 1){
			contadorDeVisitas +=1
			player.position(game.at(player.position().x(),player.position().y()-1))
			game.say(player, "Me falta una llave maestra! Donde estara?")
			game.addVisual(new LlaveMaestra(image = "MasterKey.png", position=game.at(0.randomUpTo(game.width() - 1),0.randomUpTo(game.height() - 1))))
			self.image("MasterDoor.png")
		}
		if (player.llaves() == 7 and self.contadorDeVisitas() == 2){
			contadorDeVisitas +=1
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
	var property direccion = null
	const property image = "Barril.png"
	var property esAtravesable = false
	const property tipo = "obstaculo"
	method validarLugarLibre(){
		direccion = player.direccion()
		const alLado = direccion.siguiente(position)
		return game.getObjectsIn(alLado).all{ obj => obj.esAtravesable()}
		
	}
	method movete(){
		if(self.validarLugarLibre()){
			position = self.direccion().siguiente(position)
		}
		
	}
	method colisionAccion(){
		
		self.movete()
	}
	
}

////////////////////////////////////
////comida y bebida, dan energía////
///////////////////////////////////

class ComidaYBebida{
	var property energiaQueAporta
	var property image
    var property position = game.at(0.randomUpTo(game.width() - 1),0.randomUpTo(game.height() - 1))
	var property esAtravesable = false
    const property tipo = "consumible"
    method validarLugarLibre(){
		return true
	}
	method colisionAccion(){}
	method consumir(){
		player.sumaEnergia(self.energiaQueAporta())
		game.removeVisual(self)
	}

   
}

const Ham1 = new ComidaYBebida(energiaQueAporta=20,image = "HAM.png")
const Coquita1 = new ComidaYBebida(energiaQueAporta=5,image = "Coquita.png")
const Ham2 = new ComidaYBebida(energiaQueAporta=20,image = "HAM.png")
const Coquita2 = new ComidaYBebida(energiaQueAporta=5,image = "Coquita.png")
const Ham3 = new ComidaYBebida(energiaQueAporta=20,image = "HAM.png")
const Coquita3 = new ComidaYBebida(energiaQueAporta=5,image = "Coquita.png")


