require 'bundler'
Bundler.require
require_relative 'lib/player'
require_relative 'lib/game'
player1 = Player.new('Josiane')
player2 = Player.new('José')
puts "Voici l'état de chaque joueur:"
puts"#{player1.show_state}"  
puts "#{player2.show_state}"
while @life_points != 0 
	puts "Passons à la phase d'attaque"
	player1.attacks(player2)
	player2.attacks(player1)
	puts " "
	if player1.life_points > 0 && player2.life_points > 0
		puts "Voici l'état de chaque joueur:"
		puts"#{player1.show_state}"  
		puts "#{player2.show_state}"
	elsif player1.life_points <= 0
		puts "le joueur #{player1.player_name} a été tué !"  
		break
	else 
		puts "le joueur #{player2.player_name} a été tué !"  
		break
	end	
end
