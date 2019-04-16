require_relative "player"

class Game
	attr_accessor :human_player, :enemies

	def initialize(name)
		@human_player = HumanPlayer.new(name)
		@enemies = []
	end

	def kill_player(player)
		@enemies.delete(player)
	end

	def is_still_ongoing?
		if human_player.life_points > 0 and @enemies.empty? == false
			return true
		else 
			return false	
		end
	end

	def show_players
		puts "#{name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}."
		puts "#{@enemies.count}"
	end

	def menu
		puts "****************************************"
		puts "* Quelle action veux-tu effectuer ?    *"
		puts " a - chercher une meilleure arme  "
		puts " s - chercher à se soigner"
		puts " "
		puts "Choisir le numéro de l'ennemi à attaquer"
		print "#{@enemies}"
		puts "****************************************"
	end

	def menu_choice
		input = gets.chomp

			if input == "a" 
				human_player.search_weapon
			elsif input == "s"
				human_player.search_health_pack
			elsif input >= 0
				human_player.attacks(@enemies[input])
				if @enemies[input].life_points < 0
				kill_player(@enemies[input])
				end
			end	
	end

	def enemies_attack
		@enemies.each do |player|
			player.attacks(human_player)
		end
	end

	def end
		puts "La partie est finie !"
	
		sleep 1.5

		if humanplayer.life_points > 0
		puts "BIEN OUEJ T'AS GAGNE !!"
			else
	 	puts "T'ES NUL, T'ES MORT !!"	
		end 	
	end

	def create_enemies(number_enemies)
	enemies_names = ["tom", "jean", "lea", "Edris", "Juliane", "Adaline", "Haley","Shantae", "Karol", "Marcelo", "Misty", "Alaine", "Modesto", "Karmen",   
	"Micha", "Elijah", "Nettie", "Zandra", "Isidra", "Grace", "Zachery", "Elza", "Danelle"]	
		number_enemies.to_i.times do
			player=Player.new(enemies_names.sample(1))
			@enemies << player
		end
	end
	
end	