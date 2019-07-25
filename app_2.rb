require 'bundler'
Bundler.require
require_relative 'lib/player'
require_relative 'lib/game'
#faire entrer les joueurs Pc
player1 = Player.new('Josiane')
player2 = Player.new('José')
enemies = [player1,player2] #les faire entré dans une tableau
#une initial de bienvenue pour lancer le jeu
puts "		-------------------------------------------------"
puts "		|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "		|Le but du jeu est d'être le dernier survivant !|"
puts "		-------------------------------------------------"
#faire entre le joueur humain
puts "Entré le nom de l'autre joueur : "
give_name =gets.chomp
user = HumanPlayer.new("#{give_name}")
#faire sortir l état les joueurs
puts "Voici l'état de chaque joueur:"
puts"#{player1.show_state}"  
puts"#{player2.show_state}"
puts"#{user.show_state}"
#while pour savoir si joueur humain a une vie et l un des joueur pc >0 pour que le jeu marche
while user.life_points >0 && (player1.life_points > 0 || player2.life_points >0)
	puts "§§ Passons à la phase d'attaque §§"
	puts " " 
	#choisir un bonus
	puts "Quelle action veux-tu effectuer ?
				a - chercher une meilleure arme
				s - chercher à se soigner "
	give_choice = gets.chomp
	while give_choice != "a" && give_choice != "s" #au cas ou il y a un erreur d ecriture ou tout bète
		puts "choix incorrect"
		give_choice = gets.chomp
	end
	#appliquer les choix
	if give_choice == "a"
		user.search_weapon
	else 
		user.search_health_pack
		puts"#{user.show_state}"
	end
	#faire l attaque/choix avec boucle retour/while test choix
	if player1.life_points <= 0
		puts "le joueur #{player1.player_name} a été tué !"
		puts "attaquer un joueur en vue :
			1 - José a #{player2.life_points} points de vie"
		give_choice_number = gets.chomp
		while give_choice_number != "1"
			give_choice_number = gets.chomp
			puts "choix incorrect"
		end
		user.attacks(player2)
		if player2.life_points <= 0
			break
		end
		puts"#{player2.show_state}"
	elsif player2.life_points <= 0
		puts "le joueur #{player2.player_name} a été tué !"
		puts "attaquer un joueur en vue :
			0 - Josiane a #{player1.life_points} points de vie"
		give_choice_number = gets.chomp
		while give_choice_number != "0"
			give_choice_number = gets.chomp
			puts "choix incorrect"
		end
		user.attacks(player1)
		if player1.life_points <= 0
			break
		end
		puts"#{player1.show_state}"	
	else
		puts "attaquer un joueur en vue :
		0 - Josiane a #{player1.life_points} points de vie
		1 - José a #{player2.life_points} points de vie"
		give_choice_number = gets.chomp
		while give_choice_number != "0" && give_choice_number != "1"
			puts "choix incorrect"
			give_choice_number = gets.chomp
			
		end
		if give_choice_number == "0"
			user.attacks(player1)
			if player1.life_points > 0
				puts"#{player1.show_state}"
			else
				player1.life_points = 0
				puts"#{player1.show_state}"
			end
		else
			user.attacks(player2)
				if player2.life_points > 0
				puts"#{player2.show_state}"
			else
				player2.life_points = 0
				puts"#{player2.show_state}"
			end
		end
		#attaque du pc
		puts "Les autres joueurs t'attaquent !"
		enemies.each do |player|
			if player.life_points > 0
				player.attacks(user)
			end
		end	
		if user.life_points == 0
			break
		else
			puts"#{user.show_state}"
		end
	end
end
#conclusion final
if user.life_points == 0
	puts "La partie est finie"
	puts "Tu es nul ,tu as encore perdu alors que tu as des pouvoirs"
else
puts "La partie est finie"
puts "BRAVO ! TU AS GAGNE !"
end

