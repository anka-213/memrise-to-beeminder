#!/usr/bin/env ruby

require "requests/sugar"

class Memrise
  public
  def initialize args = {}
    raise 'Username not provided.' unless args[:username]

    @username = args[:username]
  end

  def points
    r=Requests.get("http://www.memrise.com/api/user/get/?user_username=#{@username}&with_leaderboard=true")
    r.json()['user']['leaderboard']['points_alltime']
  end

end
