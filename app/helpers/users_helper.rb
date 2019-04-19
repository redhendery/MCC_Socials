module UsersHelper

  def gravatar_for(user, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

  # Batting Stat Calculations
  def bat_runs
		@user.player_stat.bat_runs
  end

  def bat_innings
    @user.player_stat.bat_innings
  end

  def batting_average
    if bat_innings == @user.player_stat.not_outs
      p '-'
    elsif bat_innings > 0 && bat_runs == 0
      batting_average = '%.2f' % 0
    else
    	innings = bat_innings - @user.player_stat.not_outs
    	'%.2f' % (bat_runs / innings.to_d)
    end
  end

  def bat_strike_rate
    if  bat_innings == 0
      p '-'
    else
    	'%.2f' % (bat_runs / @user.player_stat.balls_faced.to_d * 100)
    end
  end

# Bowling Stat Calculations
  def bowl_runs
  	if @user.player_stat.bowl_runs == 0
  		bowl_runs = '-'
  	else
  		@user.player_stat.bowl_runs
  	end
  end

  def wickets
  	@user.player_stat.wickets
  end

  def bowling_average
  	if bowl_runs == '-'
  	   p bowl_runs
  	else
	  	ave = bowl_runs / wickets.to_d
      if ave.infinite?
        p '-'
      else
        '%.2f' % ave
      end
	  end
  end

  def bowling_economy
  	if bowl_runs == '-'
       p bowl_runs
  	else
	  	overs = @user.player_stat.balls_bowled / 6
	  	'%.2f' % (bowl_runs / overs.to_d)
	  end
  end

  def bowling_strike_rate
    if @user.player_stat.bowl_innings == 0
      p '-'
    else
    	strike_rate = @user.player_stat.balls_bowled / wickets.to_d
      if strike_rate.infinite?
        p '-'
      else
        '%.2f' % strike_rate
      end
    end
  end
end
