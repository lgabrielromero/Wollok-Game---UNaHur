import wollok.game.*
import elementos.*
import hud.*





////////////////////
/////PERSONAJE//////
////////////////////

object player {
	var property position = game.center()
	var property image = "RightPlayer.png"
	var property vida = 4
	var property energia = 30
	var property direccion = null
	var property llaves = 0
	var property monedas = 0
	
	method moverArriba(){
		self.image("UpPlayer.png")
		self.direccion(arriba)
		self.energia(self.energia() - 1)
		if (self.position().y() == game.height() - 2){
			position = game.at(self.position().x(),0)
		}
		else{
			position = position.up(1)
		}
	}
	method moverAbajo(){
		self.image("DownPlayer.png")
		self.direccion(abajo)
		self.energia(self.energia() - 1)
		if (self.position().y() == 0){
			position = game.at(self.position().x(),game.height() - 2)
		}
		else{
			position = position.down(1)
		}
	}
	method moverIzquierda(){
		self.image("LeftPlayer.png")
		self.direccion(izquierda)
		self.energia(self.energia() - 1)
		if (self.position().x() == 0 ){
			position = game.at(game.width() - 1,self.position().y())
		}
		else{
			position = position.left(1)
		}
	}
	method moverDerecha(){
		self.image("RightPlayer.png")
		self.direccion(derecha)
		self.energia(self.energia() - 1)
		if (self.position().x() == game.width() - 1){
			position = game.at(0,self.position().y())
		}
		else{
			position = position.right(1)
		}
	}
	
	
	method movimientos(){
	keyboard.left().onPressDo({ self.moverIzquierda() })
	keyboard.right().onPressDo({ self.moverDerecha() })
	keyboard.up().onPressDo({ self.moverArriba() })
	keyboard.down().onPressDo({ self.moverAbajo() })
	}
	
	method danio(){
	if (self.vida() == 1){
		
		}
	else{
		self.vida(vida-1)
		game.sound("dmg.mp3").play()
		}
	barraDeVidas.barra()
	}
	
	method colision(elemento){
		elemento.colisionAccion()
	}
	
	method agarrarLlave(){
		self.llaves(self.llaves() + 1)
	}
	
	method agarrarMoneda(){
		self.monedas(self.monedas() + 1)
	}
	
}







////////////////////
//////ENEMIGO///////
////////////////////

class Enemigo{
	var property position = game.at(0.randomUpTo(game.width() - 1),0.randomUpTo(game.height() - 1))
	var property image
	
	method colisionAccion(){
		if (self.position() == game.center()){
			player.position(game.at(0.randomUpTo(game.width() - 1),0.randomUpTo(game.height() - 1)))
		}
		else{
			player.position(game.center())
		}
		player.danio()
	}
	
	method mover()
	method cambiarDireccionImg()	
}







////////////////////
/////ESQUELETO//////
////////////////////

class Esqueleto inherits Enemigo{
	method random(){return new Range(start =1,end=4).anyOne()}
	override method mover(){
		if (self.random() == 1){self.moverArriba()}
		else if (self.random() == 2){self.moverAbajo()}
		else if (self.random() == 3){self.moverIzquierda()}
		else if (self.random() == 4){self.moverDerecha()}
		else{self.cambiarDireccionImg()}
	}
	
	method moverArriba(){
		if (self.position().y() == game.height() - 2){
			position = game.at(self.position().x(),0)
		}
		else{
			position = position.up(1)
		}
	}
	method moverAbajo(){
		if (self.position().y() == 0){
			position = game.at(self.position().x(),game.height() - 2)
		}
		else{
			position = position.down(1)
		}
	}
	method moverIzquierda(){
		self.image("LeftSkeleton.png")
		if (self.position().x() == 0 ){
			position = game.at(game.width() - 1,self.position().y())
		}
		else{
			position = position.left(1)
		}
	}
	method moverDerecha(){
		self.image("RightSkeleton.png")
		if (self.position().x() == game.width() - 1){
			position = game.at(0,self.position().y())
		}
		else{
			position = position.right(1)
		}
	}
	
	override method cambiarDireccionImg(){
		if (self.image() == "LeftSkeleton.png" ){
			self.image("RightSkeleton.png")
		}
		else{
			self.image("LeftSkeleton.png")
		}
	}
}






////////////////////
//////CRANEO////////
////////////////////

class Craneo inherits Enemigo{
	
	override method mover(){
		position = game.at(0.randomUpTo(game.width() - 1),0.randomUpTo(game.height() - 2))
		self.cambiarDireccionImg()
	}
	
	override method cambiarDireccionImg(){
		if (self.image() == "LeftFloatingSkeleton.png" ){
			self.image("RightFloatingSkeleton.png")
		}
		else{
			self.image("LeftFloatingSkeleton.png")
		}
	}
}

const craneo1 = new Craneo(image = "LeftFloatingSkeleton.png")
const craneo2 = new Craneo(image = "LeftFloatingSkeleton.png")
const esqueleto1 = new Esqueleto(image = "LeftSkeleton.png")
const esqueleto2 = new Esqueleto(image = "LeftSkeleton.png")