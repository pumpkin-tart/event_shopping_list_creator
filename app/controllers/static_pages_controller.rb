class StaticPagesController < ApplicationController
    skip_before_action :require_login, only: %i[top]

    def top
        render "static_pages/top.html.erb"
    end
end