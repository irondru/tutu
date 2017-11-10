class Carriage < ApplicationRecord

  validates :bottom_places, :top_places, :side_bottom_places, :side_top_places, :sedentary_places,
            numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 80,
                           only_integer: true, allow_nil: true}

  belongs_to :train

end