class CoupeCarriage < Carriage
  validates :top_places, :bottom_places, presence: true
  validates :side_bottom_places, :side_top_places, :sedentary_places, absence: true

  def name
    I18n.t('admin.carriages.coupe_name')
  end
end