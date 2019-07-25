class Game
  attr_accessor :human_player , :enemies , :user
  def initialize(human_player)
    @human_player = human_player
    player1 = Player.new(' Joe')
    player2 = Player.new(' Jack')
    player3 = Player.new(' William')
    player4 = Player.new(' Averell')
    @user = HumanPlayer.new("#{@human_player}")
    @enemies = [player1 , player2 ,player3 , player4]
  end
  def kill_player
   @enemies.each do |element|
      if element.life_points <= 0
        @enemies.delete(element)
      end
    end
  end
  def is_still_ongoing?
    if user.life_points > 0 && ( @enemies[0].life_points > 0 || @enemies[1].life_points > 0 || @enemies[2].life_points > 0 || @enemies[3].life_points > 0 )
      return true
    else
      return false
    end
  end
  def show_players
    @user.show_state
    player_number = 1
    @enemies.each do |number|
      number.show_state
      player_number += 1
    end
    puts " "
    puts "le nombre de joueur est #{player_number}"
  end
  def menu
    puts "Quelle action veux-tu effectuer ?
      a - chercher une meilleure arme
      s - chercher à se soigner "
      puts "attaquer un joueur en vue : "
      for i in 0..@enemies.length-1 do
        if @enemies[i].life_points > 0
          puts "#{i} - #{@enemies[i].player_name} a #{@enemies[i].life_points} points de vie"
        end
      end
  end

  def menu_choice
    puts " "
    puts "fait ton choix"
    menu
    puts "  "
    print ">>>>  "
    give_choice = gets.chomp
    puts " "
    while give_choice != "a" && give_choice != "s" && give_choice != "0" && give_choice != "1" && give_choice != "2" && give_choice != "3" 
      puts "refait le choix ,il y avait un erreur"
      print ">>>>  "
      give_choice = gets.chomp
      puts " "
    end
    if give_choice == "a"
      user.search_weapon
      puts " "
      puts"#{user.show_state}"
    elsif give_choice == "s"
      user.search_health_pack
      puts " "
      puts"#{user.show_state}"
    else
      for i in 0..@enemies.length-1
        if give_choice == "#{i}"
          user.attacks(@enemies[i])
          if @enemies[i].life_points > 0
            puts " "
            puts"#{@enemies[i].show_state}"
          else
            puts " "
            @enemies[i].life_points = 0
            puts"#{@enemies[i].show_state}"
          end
        end
      end
    end
    kill_player
    #puts @enemies
  end
  def enemies_attack
    puts "Les autres joueurs t'attaquent !"
    enemies.each do |player|
      if player.life_points > 0
        player.attacks(user)
      end
    end 
    puts " "
    puts "**** Votre etat actuel*****"
    puts"#{user.show_state}"
  end
  def end
    puts "le jeu est terminé"
    if user.life_points > 0
      puts '******Bravo , tu a gagné**********'
    else 
      puts 'Loser , tu a Perdu '
    end
  end
end