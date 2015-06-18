class ElementsController < ApplicationController
  def index
    @elements = current_account.elements
    render json: {elements: @elements.map {|e| e.slice(:id, :name)}}
  end
end
