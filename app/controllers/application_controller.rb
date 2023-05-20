# Application controller class extends the ActionController class

class ApplicationController < ActionController::Base
  def current_user
    User.first
  end
end
