class UsersController < ApplicationController

  def top_10
	  @top_10 = User.top_10
  end
end