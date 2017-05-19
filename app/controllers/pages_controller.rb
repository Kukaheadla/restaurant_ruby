class PagesController < ApplicationController

  def home
    @tables = Table.all
  end
end
