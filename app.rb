require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josiane")
player2 = Player.new("José")

puts "----------------------------------------------------------"
puts "Mesdames et messieurs, le combat va maintenant commencer !"
puts "----------------------------------------------------------"

sleep 2 #Les sleep permettent de ralentir l'execution du code à des endroits précis, mon but est uniquement esthétique.

puts "Voici l'état de chaque joueur"
puts "-----------------------------"

sleep 1.5

puts "#{player1.show_state}"
puts "-----------------------"
sleep 1.5

puts "#{player2.show_state}"

sleep 2

puts "---------------------------"
puts "Passons à la phase d'attaque"
puts "---------------------------"

	while player1.life_points > 0 && player2.life_points > 0

		player1.attacks(player2)
	
			if player2.life_points < 1
				break #rompt la boucle si player est dead
		
			else	

			player2.attacks(player1)

			end
		
		puts "------------------"
		puts player1.show_state
		puts "------------------"
		puts player2.show_state
		puts "------------------"	

	end
# binding.pry