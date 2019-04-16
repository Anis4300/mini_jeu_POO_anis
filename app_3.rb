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

	