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
	}
	method colisionAccion(){}
}

class LlaveMaestra inherits Llave{
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
	}
	method validarLugarLibre(){
		return true
	}
	method image()= "Coin.png"
}
const moneda1=new Moneda ()
const moneda2=new Moneda ()
const moneda3=new Moneda ()
const moneda4=new Moneda ()
const moneda5=new Moneda ()
const moneda6=new Moneda ()
const moneda7=new Moneda ()
const moneda8=new Moneda ()
const moneda9=new Moneda ()
const moneda10=new Moneda()



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

////////////////////////////////////
////comida y bebida, dan energía////
///////////////////////////////////

class ComidaYBebida{
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
		
	}

   
}

const comida1 = new ComidaYBebida(energiaQueAporta=20,image = "pata.png")
const comida2 = new ComidaYBebida(energiaQueAporta=5,image = "costilla.png")
const comida3 = new ComidaYBebida(energiaQueAporta=20,image = "carne.png")
const bebida1 = new ComidaYBebida(energiaQueAporta=5,image = "chop.png")
const bebida2 = new ComidaYBebida(energiaQueAporta=20,image = "chop.png")
const bebida3 = new ComidaYBebida(energiaQueAporta=5,image = "chop.png")

////POCION REVITALIZADORA///
class Pocion{
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
	}
}

const pocion1= new Pocion (image= "pocion.png",energiaQueAporta=30)
