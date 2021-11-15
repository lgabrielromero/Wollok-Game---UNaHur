import wollok.game.*
import fondo.*
import personajes.*
import elementos.*
import nivel2.*
import hud.*
import direcciones.*
import paredes.*
import visuals.*
import utilidades.*

object nivelBloques {

	method configurate() {
		// fondo - es importante que sea el primer visual que se agregue
		game.addVisual(new Fondo(image="dungeonwall.png"))
		// Soundtrack del nivel 
		
		// Elementos del Hud (Estado del jugador)
		borde.addBordeCompleto()
		interfaz.agregar()
		// otros visuals, p.ej. bloques o llaves
		pisosAleatorios.agregar() // ESTO VA PRIMERO XQ ES UN PISO
		game.addVisual(new Puerta(position=game.at(game.width() /2,game.height()-2)))
		game.addVisual(new Barril(position= game.center().up(1).left(2)))
		
		llaveslvl1.agregar() 
		
		//Consumibles
		consumiblesLvl1.agregar()
		// Enemigos
		game.addVisual(esqueleto1)
		game.addVisual(esqueleto2)
		// personaje, es importante que sea el último visual que se agregue
		game.addVisual(player)
		// teclado
		player.nivel(1)	
		player.movimientos()
		utilidadesParaJuego.iniciarMovimientosAutomaticos()
		game.whenCollideDo(player, { elemento => player.colision(elemento)})
		// este es para probar, no es necesario dejarlo
		keyboard.t().onPressDo({ self.terminar() })
		game.say(player, "Debo abrir la puerta!")

		// en este no hacen falta colisiones
	}
	
	method terminar() {
		// game.clear() limpia visuals, teclado, colisiones y acciones
		game.clear()
		// después puedo volver a agregar el fondo, y algún visual para que no quede tan pelado
		game.addVisual(new Fondo(image="dungeonwall.png"))
		game.addVisual(player)
		player.image("DownPlayer.png")
		game.say(player, "Lo Logramos!!")
		// después de un ratito ...
		game.schedule(2500, {
			game.clear()
			// cambio de fondo
			game.addVisual(new Fondo(image="finNivel1.png"))
			// después de un ratito ...
			keyboard.enter().onPressDo( {
				// ... limpio todo de nuevo
				game.clear()
				// y arranco el siguiente nivel
		
				
				player.resetStats()
				nivelLlaves.configurate()
			})
		})
	}
	
	method perderPorVida() {
			game.clear()
			game.addVisual(new Fondo(image="PerderSinVida.png"))
			keyboard.enter().onPressDo({
				game.clear()
				player.resetStats()
				self.configurate()
			})
	}
	
	method perderPorEnergia() {
			game.clear()
			game.addVisual(new Fondo(image="PerderSinEnergia.png"))
			keyboard.enter().onPressDo( {
				game.clear()
				player.resetStats()
				self.configurate()
			})
	}
		
}

