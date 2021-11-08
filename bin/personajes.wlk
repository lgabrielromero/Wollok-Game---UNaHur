import wollok.game.*
import hud.*
// en la implementación real, conviene tener un personaje por nivel
// los personajes probablemente tengan un comportamiendo más complejo que solamente
// imagen y posición

object player {
	var property position = game.center()
	var property image = "RightPlayer.png"
	var property vida = 4
	var property energia = 30



	method moverArriba(){
		self.image("UpPlayer.png")
		self.energia(self.energia() - 1)
		if (self.position().y() == game.height() - 1){
			position = game.at(self.position().x(),0)
		}
		else{
			position = position.up(1)
		}
	}
	method moverAbajo(){
		self.image("DownPlayer.png")
		self.energia(self.energia() - 1)
		if (self.position().y() == 0){
			position = game.at(self.position().x(),game.height() - 1)
		}
		else{
			position = position.down(1)
		}
	}
	method moverIzquierda(){
		self.image("LeftPlayer.png")
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
		game.stop()
		}
	else{
		self.vida(vida-1)
		position = game.center()
		game.sound("dmg.mp3").play()
		}
	barraDeVidas.barra()
	}
	
	method colision(elemento){
		if (elemento == craneo1 or elemento == craneo2){
			self.danio()
		}
	}
	
}


class Esqueleto{
	var property position = game.at(0.randomUpTo(game.width() - 1),0.randomUpTo(game.height() - 1))
	var property image = "LeftSkeleton.png"
	
	method mover(){}
}

class Craneo{
	var property position = game.at(0.randomUpTo(game.width() - 1),0.randomUpTo(game.height() - 1))
	var property image = "LeftFloatingSkeleton.png"
	
	method mover(){
		position = game.at(0.randomUpTo(game.width() - 1),0.randomUpTo(game.height() - 1))
	}
}

const craneo1 = new Craneo()
const craneo2 = new Craneo()