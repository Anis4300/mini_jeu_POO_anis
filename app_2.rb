require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


	puts "-----------------------------------------------------"
	puts "|      Bienvenu sur 'ILS VEULENT TOUS MA POO'!      |"
	puts "|   Le but du jeu est d'etre le dernier survivant   |"
	puts "-----------------------------------------------------"

	puts " "
	
	sleep 1.5

	puts "Quel est ton prénom?"
	print ">"
	humanplayer1 = HumanPlayer.new("#{gets.chomp.to_s}") #nommer le Humanplayer comme l'utilisateur

	player1 = Player.new("Josiane")
	player2 = Player.new("José")

	enemies = [player1, player2]

	while humanplayer1.life_points > 0 &&  (player1.life_points > 0 || player2.life_points > 0)
		

		puts "*************************************"
		puts "* Quelle action veux-tu effectuer ? *"
		puts " a - chercher une meilleure arme  "
		puts " s - chercher à se soigner"
		puts " "
		puts "* Attaquer un joueur en vue :       *"
		
		print " 0 -"                  # defaut d'affichage que j'arrive à corriger en sautant cette ligne.
		print "#{player1.show_state}"
		

		print " 1 -"                  #  defaut d'affichage que j'arrive à corriger en sautant cette ligne.
		print "#{player2.show_state}"
		
		puts " "
		puts "*************************************"
		print ">"
		input = gets.chomp.to_s

			if input == "a" 
				humanplayer1.search_weapon
			elsif input == "s"
				humanplayer1.search_health_pack
			elsif input == "0"
				humanplayer1.attacks(player1)
			elsif input == "1"
				humanplayer1.attacks(player2)
			end	
		sleep 1		

		puts "Les bots t'attaquent !"

		enemies.each do |player|
			if player.life_points > 0
				player.attacks(humanplayer1)
			end
		end	
		sleep 1		
				
		puts "#{humanplayer1.show_state}"

		sleep 1
	end

	puts "La partie est finie !"
	
	sleep 1.5

	if humanplayer1.life_points > 0
		puts "BIEN OUEJ T'AS GAGNE !!"
	else
	 	puts "T'ES NUL, T'ES MORT !!"	
	end 	