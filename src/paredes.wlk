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
	var property image 
	var property contadorDeVisitas = 0 
	const property tipo = "piso"
	
	method esAtravesable() = true
	method colisionAccion(){}
	method validarLugarLibre(){return true}
}


class PisoQuitaEnergia inherits PisoSorpresa(image = "pisoEnergiaTrampa.png" ){
	override method colisionAccion(){
		if(contadorDeVisitas == 0){
			contadorDeVisitas +=1
			player.restaEnergia(15)
			game.sound("error.mp3").play()
			image = "pisoEnergiaTrampaDown.png"
		}
		
	}
}

class PisoSumaEnergia inherits PisoSorpresa(image = "pisoEnergia.png" ){
	override method colisionAccion(){
		if(contadorDeVisitas == 0){
			contadorDeVisitas +=1
			player.sumaEnergia(30)
			game.sound("1up.mp3").play()
			image = "pisoEnergiaDown.png"
		}
		
	}
}

class PisoItemAleatorio inherits PisoSorpresa(image = "pisoObjeto.png" ){
	const pocionMana = new PocionMana(energiaQueAporta=50,image = "pocionMana.png")
	override method colisionAccion(){
		if(contadorDeVisitas == 0){
			contadorDeVisitas +=1
			game.addVisual(pocionMana)
			game.sound("teleport.mp3").play()
			image = "pisoObjetoDown.png"
		}
		
	}
}

class PisoTeletransporta inherits PisoSorpresa(image = "pisoTele.png" ){
	override method colisionAccion(){
		player.position(game.center())
		game.sound("teleport.mp3").play()
	}
	
}