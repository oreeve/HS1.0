require 'unirest'

class CardsController < ApplicationController
  def index
    if params[:name]
      @card = get_card_by_name(params[:name])
    end

    if params[:class]
      @class_cards = get_class_cards(params[:class])
    end

  end

  def get_card_by_name(name)
    response = Unirest.get "https://omgvamp-hearthstone-v1.p.mashape.com/cards/#{name}",
      headers:{
        "X-Mashape-Key" => ENV["X_MASHAPE_KEY"]
      }
    if !response.body.include?("error")
      response.body.first
    else
      {name: "Card Not Found"}
    end
  end

  def get_class_cards(card_class)
    response = Unirest.get "https://omgvamp-hearthstone-v1.p.mashape.com/cards/classes/#{card_class}",
      headers:{
        "X-Mashape-Key" => ENV["X_MASHAPE_KEY"]
      }
    response.body
  end
end
