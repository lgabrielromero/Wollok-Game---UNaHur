import wollok.game.*

// en la implementación real, conviene tener un personaje por nivel
// los personajes probablemente tengan un comportamiendo más complejo que solamente
// imagen y posición

object player {
	var property position = game.center()
	var property image = "RightPlayer.png"
	var property vida = 100
	var property energia = 30



	method moverArriba(){
		self.image("UpPlayer.png")
		self.energia(self.energia() - 1)
	}
	method moverAbajo(){
		self.image("DownPlayer.png")
		self.energia(self.energia() - 1)
	}
	method moverIzquierda(){
		self.image("LeftPlayer.png")
		self.energia(self.energia() - 1)
	}
	method moverDerecha(){
		self.image("RightPlayer.png")
		self.energia(self.energia() - 1)
	}
	
	method movimientos(){
	keyboard.left().onPressDo({ self.moverIzquierda() })
	keyboard.right().onPressDo({ self.moverDerecha() })
	keyboard.up().onPressDo({ self.moverArriba() })
	keyboard.down().onPressDo({ self.moverAbajo() })
	}
}

