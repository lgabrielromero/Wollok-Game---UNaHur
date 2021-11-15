import wollok.game.*
import personajes.*
import nivel1.*
import nivel2.*
import direcciones.*
import utilidades.*


////////////////////
///////LLAVE////////
////////////////////



class Llave {
	var property position
	const property image
	const property tipo = "item" 	
	var property esAtravesable = false
		
	method validarLugarLibre(){return false}
	
	method recoger(){
		player.agarrarLlave()
		game.removeVisual(self)
		game.sound("keyPickup.mp3").play()
	}
	method colisionAccion(){}
}

class LlaveMaestra inherits Llave{
	override method recoger(){
		player.agarrarLlave()
		game.removeVisual(self)
		game.sound("keyPickup.mp3").play()
		game.sound("holy.mp3").play()
		
	}
	
}



////////////////////
//////MONEDA////////
////////////////////

class Moneda {
	var property position= randomSinPisarse.colocar()
	
	const property tipo = "dinero"
	var property esAtravesable = false
	method colisionAccion(){
		game.removeVisual(self)
		player.agarrarMoneda()
		game.sound("coinUp.mp3").play()
	}
	method validarLugarLibre(){
		return true
	}
	method image()= "Coin.png"
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
			game.addVisual(new Llave(image = "Key.png", position=randomSinPisarse.colocar()))
			game.addVisual(new Llave(image = "Key.png", position=randomSinPisarse.colocar()))
			game.addVisual(new Llave(image = "Key.png", position=randomSinPisarse.colocar()))
		}
		if (player.llaves() == 6 and self.contadorDeVisitas() == 1){
			contadorDeVisitas +=1
			player.position(game.at(player.position().x(),player.position().y()-1))
			game.say(player, "Busquemos esa Llave Maestra!")
			game.addVisual(new LlaveMaestra(image = "MasterKey2.png", position= randomSinPisarse.colocar()))
			self.image("MasterDoor.png")
		}
		if (player.llaves() == 7 and self.contadorDeVisitas() == 2){
			contadorDeVisitas +=1
			game.sound("door_Open.mp3").play()
			nivelBloques.terminar()
		}
		else{
			game.say(player, "Necesito las 3 llaves!")
		}
	}
}

class PuertaLvl2 inherits Puerta{
	override method colisionAccion(){
		if (player.monedas() == 10){
			nivelLlaves.ganar()
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

///////////////////////////////////////////
////Consumibles: Se agarran con espacio///
/////////////////////////////////////////

class Consumible{
	var property energiaQueAporta
	var property image
    var property position = randomSinPisarse.colocar()
	var property esAtravesable = false
    const property tipo = "consumible"
    method validarLugarLibre(){
		return false
	}
	method colisionAccion(){}
	method consumir(){
		player.sumaEnergia(self.energiaQueAporta())
		game.removeVisual(self)
		game.sound("comer.mp3").play()
		
	}

   
}

class PocionVida inherits Consumible{
	override method consumir(){
		player.sumaVida(self.energiaQueAporta())
		game.sound("drink.mp3").play()
		game.removeVisual(self)
	}
}

class PocionMana inherits Consumible{
	var property vida = 25
	var property energia = 25
	override method consumir(){
		player.sumaVida(vida )
		player.sumaEnergia(energia)
		game.sound("drink.mp3").play()
		game.removeVisual(self)
	}
}

class Bomba inherits Consumible(energiaQueAporta = 15, image = "bombaInactiva.png"){
	override method consumir(){
		player.sumaGranada(energiaQueAporta)
		game.sound("agarrar.mp3").play()
		game.removeVisual(self)
	}
}


