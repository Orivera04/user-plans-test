class HomeController < ApplicationController
  include Controllerable
  before_action :authenticate_user!
end
