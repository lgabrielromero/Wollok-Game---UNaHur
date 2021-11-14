import wollok.game.*
import personajes.*
import elementos.*
import hud.*

// PARED (Los objetos no pueden atravesarlo)
class Wall{
	var property position
	const property image = "WALL.png"
	const property tipo = "muro"
	method esAtravesable() = false
	method colisionAccion(){}
	method validarLugarLibre(){return true}
}




class PisoSorpresa {
	var property position
	var property contadorDeVisitas = 0 
	const property tipo = "piso"
	
	method esAtravesable() = true
	method colisionAccion(){}
	method validarLugarLibre(){return true}
}


class PisoQuitaEnergia inherits PisoSorpresa{
	override method colisionAccion(){
		if(contadorDeVisitas == 0){
			contadorDeVisitas +=1
			player.restaEnergia(15)
		}
		
	}
}

class PisoSumaEnergia inherits PisoSorpresa{
	override method colisionAccion(){
		if(contadorDeVisitas == 0){
			contadorDeVisitas +=1
			player.sumaEnergia(30)
		}
		
	}
}

class PisoItemAleatorio inherits PisoSorpresa{
	const items = [new Consumible(energiaQueAporta=20,image = "HAM.png"),new Consumible(energiaQueAporta=15,image = "Coquita.png")]
	method random(){return new Range(start =0,end=1).anyOne()}
	override method colisionAccion(){
		if(contadorDeVisitas == 0){
			contadorDeVisitas +=1
			game.addVisual(items.get(self.random()))
		}
		
	}
}

class PisoTeletransporta inherits PisoSorpresa{
	override method colisionAccion(){player.position(game.center())}
}