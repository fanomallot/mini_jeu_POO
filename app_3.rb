require 'bundler'
Bundler.require
require_relative 'lib/player'
require_relative 'lib/game'
 #les faire entré dans une tableau
#une initial de bienvenue pour lancer le jeu
puts "		-------------------------------------------------"
puts "		|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "		|Le but du jeu est d'être le dernier survivant !|"
puts "		-------------------------------------------------"
#faire entre le joueur humain
puts "  Entré votre nom de joueur : "
print " Le gladiateur  "
give_name = gets.chomp
my_app = Game.new(give_name)
puts ""
puts "§§§ VOICI DONC LES JOUEUR !! §§§§"
my_app.show_players
puts " "
while my_app.is_still_ongoing? == true
	puts "C'est votre tour de faire l'attaque,appuis Entrée"
	give_name = gets.chomp
	my_app.menu_choice
	 if my_app.enemies.length == 0 
	 	break
	 end
	 puts " "
	puts "Appuis sur Entrée , c'est leurs tours"
	give_name = gets.chomp 
	my_app.enemies_attack
end
my_app.end