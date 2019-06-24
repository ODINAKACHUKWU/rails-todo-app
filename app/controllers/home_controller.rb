class HomeController < ApplicationController

    def delete_completed_todos
        @delete_completed = List.where(:completed => true).destroy_all
        redirect_to root_url, notice: 'All marked items were successfully deleted.'
    end

    def delete_all_todos
        @delete_all = List.all.destroy_all
        redirect_to root_url, notice: 'All items were successfully deleted.'
    end

end
