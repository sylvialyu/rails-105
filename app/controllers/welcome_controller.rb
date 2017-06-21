class WelcomeController < ApplicationController

  def index
    flash[:notice] = "你好呀！"
  end

end
