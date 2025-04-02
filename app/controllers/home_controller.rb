class HomeController < ApplicationController
  before_action :authenticate_usuario!, except: %i[index]


  def index
  end
end
