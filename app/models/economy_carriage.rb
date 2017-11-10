class EconomyCarriage < Carriage
  validates :side_top_places, :side_bottom_places, :top_places, :bottom_places, presence: true
  validates :sedentary_places, absence: true
  def name
    I18n.t('admin.carriages.economy_name')
  end
end