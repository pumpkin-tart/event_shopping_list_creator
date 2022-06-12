class StaticPagesController < ApplicationController
    skip_before_action :require_login, only: %i[top]

    def top
        redirect_to login_path
    end
end