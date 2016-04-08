class CatsController < ApplicationController
  def index
    @cats = Cat.all
    @column_names = Cat.column_names
  end

  def new
  end

  def create
  end

  def destroy
  end
end
