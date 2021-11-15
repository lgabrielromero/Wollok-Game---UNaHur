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
	var property enemigosMuertos = 0

	method configurate() {
		player.movimientos()
		self.enemigosMuertos(0)
		// fondo - es importante que sea el primer visual que se agregue
		game.addVisual(new Fondo(image="dungeonwall.png"))
		borde.addBordeCompleto()
		interfaz.agregar()
		// otros visuals, p.ej. bloques o llaves
		
		
		
		// enemigos
		game.addVisual(craneo1)
		game.addVisual(craneo2)
		game.addVisual(esqueleto1)
		game.addVisual(esqueleto2)
		game.addVisual(esqueleto3)
		consumiblesLvl3.agregar()
		utilidadesParaJuego.iniciarMovimientosAutomaticos()
		// personaje, es importante que sea el último visual que se agregue
		game.addVisual(player)
		game.whenCollideDo(player, { elemento => player.colision(elemento)})
		// teclado
		player.nivel(3)
		// este es para probar, no es necesario dejarlo
		keyboard.g().onPressDo({ self.ganar() })
		game.say(player, "Debo matar 30 enemigos!")

		// colisiones, acá sí hacen falta
	}
	
	method ganar() {
		game.clear()
		// después puedo volver a agregar el fondo, y algún visual para que no quede tan pelado
		game.addVisual(new Fondo(image="dungeonwall.png"))
		player.position(game.center())
		game.addVisual(player)
		player.image("DownPlayer.png")
		game.say(player, "GANAMOS! FELICIDADES!")
		// después de un ratito ...
		game.schedule(2500, {
			game.clear()
			game.addVisual(new Fondo(image="finBonus.png"))
			keyboard.enter().onPressDo( {
				game.stop()
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
			keyboard.enter().onPressDo({
				game.clear()
				player.resetStats()
				self.configurate()
			})
	}
	
	
}
