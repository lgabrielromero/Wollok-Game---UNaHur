import wollok.game.*
import fondo.*
import personajes.*
import elementos.*
import nivel2.*
import hud.*
import direcciones.*
import paredes.*

object nivelBloques {

	method configurate() {
		// fondo - es importante que sea el primer visual que se agregue
		game.addVisual(new Fondo(image="dungeonwall.png"))
		// Soundtrack del nivel 
		const ost = game.sound("backgroundOST.mp3")
		ost.shouldLoop(true)
		game.schedule(500, { ost.play()} )
		
		// Elementos del Hud (Estado del jugador)
		borde.addBordeCompleto()
		game.addVisual(barraDeVidas)
		game.addVisual(barraDeEnergia)
		// otros visuals, p.ej. bloques o llaves
		game.addVisual(new Puerta(position=game.at(game.width() /2,game.height()-2)))
		game.addVisual(new Barril(position= game.center().up(1).left(2)))
		game.addVisual(new Llave(image = "Key.png", position=game.at(0.randomUpTo(game.width() - 1),0.randomUpTo(game.height() - 1))))
		game.addVisual(new Llave(image = "Key.png", position=game.at(0.randomUpTo(game.width() - 1),0.randomUpTo(game.height() - 1))))
		game.addVisual(new Llave(image = "Key.png", position=game.at(0.randomUpTo(game.width() - 1),0.randomUpTo(game.height() - 1))))
		//comidas
		game.addVisual(Ham1)
		game.addVisual(Coquita1)
		game.addVisual(Ham2)
		game.addVisual(Coquita2)
		game.addVisual(Ham3)
		game.addVisual(Coquita3)
		// Enemigos
		game.addVisual(craneo1)
		game.addVisual(esqueleto1)
		game.addVisual(esqueleto2)
		// personaje, es importante que sea el último visual que se agregue
		game.addVisual(player)
		
		// teclado
		// este es para probar, no es necesario dejarlo
		keyboard.t().onPressDo({ self.terminar() })

		// en este no hacen falta colisiones
	}
	
	method terminar() {
		// game.clear() limpia visuals, teclado, colisiones y acciones
		game.clear()
		// después puedo volver a agregar el fondo, y algún visual para que no quede tan pelado
		game.addVisual(new Fondo(image="fondoCompleto.png"))
		game.addVisual(player)
		// después de un ratito ...
		game.schedule(2500, {
			game.clear()
			// cambio de fondo
			game.addVisual(new Fondo(image="finNivel1.png"))
			// después de un ratito ...
			game.schedule(3000, {
				// ... limpio todo de nuevo
				game.clear()
				// y arranco el siguiente nivel
				nivelLlaves.configurate()
			})
		})
	}
		
}

