class ListsController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to @list
    else
      render :new
    end
  end

  def show
    @list = load_list_from_url
    @barback = Barback.new(@list)
  end

  def edit
    @list = load_list_from_url
    @barback = Barback.new(@list)
  end

  def update
    @list = load_list_from_url

    if @list.update(list_params)
      redirect_to @list
    else
      render :edit
    end
  end

  private

  def list_params
    params.require(:list).
      permit(:name, :serves).
      merge(user: current_user)
  end

  def load_list_from_url
    List.find(params[:id])
  end
end
