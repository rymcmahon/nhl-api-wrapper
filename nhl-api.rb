class NhlApi
  require 'net/http'
  require 'json'

  BASE_URL = 'https://statsapi.web.nhl.com/api/v1'

  def player(id)
    end_point = "/people/#{id}"
    uri = URI("#{NhlApi::BASE_URL}#{end_point}")
    response = Net::HTTP.get_response(uri)

    if response.code == '200'
      json_response = JSON.parse(response.body)
      json_response["people"]
    else
      puts "#{response.code} #{response.message}"
    end
  end

  def roster(id)
    end_point = "/teams/#{id}/roster"
    uri = URI("#{NhlApi::BASE_URL}#{end_point}")
    response = Net::HTTP.get_response(uri)

    if response.code == '200'
      json_response = JSON.parse(response.body)
      json_response["roster"]
    else
      puts "#{response.code} #{response.message}"
    end
  end

  def single_season_stats(player_id, season)
    end_point = "/people/#{player_id}/stats?stats=statsSingleSeason&season=#{season}"
    uri = URI("#{NhlApi::BASE_URL}#{end_point}")
    response = Net::HTTP.get_response(uri)

    if response.code == '200'
      json_response = JSON.parse(response.body)
      json_response["stats"][0]["splits"][0]["stat"]
    else
      puts "#{response.code} #{response.message}"
    end
  end

  def career_stats_regular_season(player_id)
    end_point = "/people/#{player_id}/stats?stats=careerRegularSeason"
    uri = URI("#{NhlApi::BASE_URL}#{end_point}")
    response = Net::HTTP.get_response(uri)

    if response.code == '200'
      json_response = JSON.parse(response.body)
      json_response["stats"][0]["splits"][0]["stat"]
    else
      puts "#{response.code} #{response.message}"
    end
  end

  def career_stats_playoffs(player_id)
    end_point = "/people/#{player_id}/stats?stats=careerPlayoffs"
    uri = URI("#{NhlApi::BASE_URL}#{end_point}")
    response = Net::HTTP.get_response(uri)

    if response.code == '200'
      json_response = JSON.parse(response.body)
      json_response["stats"][0]["splits"][0]["stat"]
    else
      puts "#{response.code} #{response.message}"
    end
  end
end
