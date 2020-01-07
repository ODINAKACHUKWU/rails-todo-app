class HomeController < ApplicationController
  before_action :authenticate

  def index; end

  def delete_completed_todos
    @delete_completed = List.where(:completed => true).destroy_all
    redirect_to lists_path, notice: "All marked items were successfully deleted."
  end

  def delete_all_todos
    @delete_all = List.all.destroy_all
    redirect_to lists_path, notice: "All items were successfully deleted."
  end
end
