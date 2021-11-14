import wollok.game.*
import fondo.*
import personajes.*
import elementos.*
import nivel1.*
import hud.*
import direcciones.*
import paredes.*
import visuals.*
import utilidades.*

object nivelBonus {

	method configurate() {
		player.movimientos()
		// fondo - es importante que sea el primer visual que se agregue
		game.addVisual(new Fondo(image="dungeonwall.png"))
		borde.addBordeCompleto()
		interfaz.agregar()
		// otros visuals, p.ej. bloques o llaves
		game.addVisual(new PuertaLvl2(position=game.at(game.width() /2,game.height()-2)))
		monedaslvl2.agregar()
		
		// enemigos
		game.addVisual(craneo1)
		utilidadesParaJuego.iniciarMovimientosAutomaticos()
		// personaje, es importante que sea el último visual que se agregue
		game.addVisual(player)
		game.whenCollideDo(player, { elemento => player.colision(elemento)})
		// teclado
		player.nivel(3)
		// este es para probar, no es necesario dejarlo
		keyboard.g().onPressDo({ self.ganar() })

		// colisiones, acá sí hacen falta
	}
	
	method ganar() {
		// es muy parecido al terminar() de nivelBloques
		// el perder() también va a ser parecido
		
		// game.clear() limpia visuals, teclado, colisiones y acciones
		game.clear()
		// después puedo volver a agregar el fondo, y algún visual para que no quede tan pelado
		game.addVisual(new Fondo(image="dungeonwall.png"))
		// después de un ratito ...
		game.schedule(2500, {
			game.clear()
			// cambio de fondo
			game.addVisual(new Fondo(image="ganamos.png"))
			// después de un ratito ...
			game.schedule(3000, {
				// fin del juego
				game.stop()
			})
		})
	}
	
	method perderPorVida() {
			game.clear()
			game.addVisual(new Fondo(image="PerderSinVida.png"))
			game.schedule(3000, {
				game.clear()
				player.resetStats()
				self.configurate()
			})
	}
	
	method perderPorEnergia() {
			game.clear()
			game.addVisual(new Fondo(image="PerderSinEnergia.png"))
			game.schedule(3000, {
				game.clear()
				player.resetStats()
				self.configurate()
			})
	}
	
	
}
