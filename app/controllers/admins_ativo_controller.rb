class AdminsAtivoController < ApplicationController
    layout 'ativos_layout'
    before_action :authenticate_admin!
end
