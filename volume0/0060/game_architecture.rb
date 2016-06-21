#!/usr/bin/ruby
# 題材のゲームそのものを作った場合のソース

class Game
  def initialize
    # デッキの初期化
    @deck = (1..10).shuffle
    # 配るカードの準備
    close_card_p1 = @deck.shift
    close_card_p2 = @deck.shift
    open_card_p1 = @deck.shift
    open_card_p2 = @deck.shift
    # プレイヤーの初期化
    @player1 = Player.new(close_card_p1, open_card_p1)
    @player2 = Player.new(close_card_p2, open_card_p2)
  end

  attr_reader :deck, :player1, :player2
end

class Player
  def initialize(close_card, open_card)
    @close_card = close_card
    @open_card = open_card
  end

  attr_reader :close_card, :open_card

  def show_open_card
    @open_card
  end

  def show_both_cards
    [@close_card, @open_card]
  end
end

game = Game.new