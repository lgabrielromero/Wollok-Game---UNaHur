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
import nivel3.*

object nivelLlaves {

	method configurate() {
		player.movimientos()
		// fondo - es importante que sea el primer visual que se agregue
		game.addVisual(new Fondo(image="dungeonwall.png"))
		borde.addBordeCompleto()
		interfaz.agregar()
		// otros visuals, p.ej. bloques o llaves
		pisosAleatorios.agregar() // ESTO VA PRIMERO XQ ES UN PISO
		game.addVisual(new Barril(position= game.center().up(1).left(2)))
		game.addVisual(new PuertaLvl2(position=game.at(game.width() /2,game.height()-2)))
		monedaslvl2.agregar()
		consumiblesLvl2.agregar()
		// enemigos
		game.addVisual(craneo1)
		game.addVisual(craneo2)
		utilidadesParaJuego.iniciarMovimientosAutomaticoslvl2()
		// personaje, es importante que sea el último visual que se agregue
		game.addVisual(player)
		game.whenCollideDo(player, { elemento => player.colision(elemento)})
		// teclado
		player.nivel(2)
		// este es para probar, no es necesario dejarlo
		keyboard.g().onPressDo({ self.ganar() })
		game.say(player, "Cuanto dinero! Debo llevarmelo!")

		// colisiones, acá sí hacen falta
	}
	
	method ganar() {
		// es muy parecido al terminar() de nivelBloques
		// el perder() también va a ser parecido
		
		// game.clear() limpia visuals, teclado, colisiones y acciones
		game.clear()
		// después puedo volver a agregar el fondo, y algún visual para que no quede tan pelado
		game.addVisual(new Fondo(image="dungeonwall.png"))
		game.addVisual(player)
		player.image("DownPlayer.png")
		game.say(player, "Vamos! Salgamos del Castillo!!")
		// después de un ratito ...
		game.schedule(2500, {
			game.clear()
			// cambio de fondo
			game.addVisual(new Fondo(image="ganamos.png"))
			// después de un ratito ...
			keyboard.enter().onPressDo( {
				// ... limpio todo de nuevo
				game.clear()
				// y arranco el siguiente nivel
				player.resetStats()
				nivelBonus.configurate()
			})
		})
	}
	
	method perderPorVida() {
			game.clear()
			game.addVisual(new Fondo(image="PerderSinVida.png"))
			keyboard.enter().onPressDo({
				game.clear()
				player.resetStats()
				utilidadesParaJuego.resetearEnemigo()
				self.configurate()
			})
	}
	
	method perderPorEnergia() {
			game.clear()
			game.addVisual(new Fondo(image="PerderSinEnergia.png"))
			keyboard.enter().onPressDo({
				game.clear()
				player.resetStats()
				utilidadesParaJuego.resetearEnemigo()
				self.configurate()
			})
	}
	
	
}
