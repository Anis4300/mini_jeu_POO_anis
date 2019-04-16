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
	my_game = Game.new("#{gets.chomp.to_s}")

	puts "Combien d'ennemies voulez-vous afronter? (20 max)"
	print ">"
	my_game.create_enemies(gets.chomp.to_i)
	
while my_game.is_still_ongoing? == true

	my_game.menu
	
	my_game.menu_choice

	my_game.enemies_attack

end

	my_game.end