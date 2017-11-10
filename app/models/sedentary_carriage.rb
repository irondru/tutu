class SedentaryCarriage < Carriage

  validates :sedentary_places, presence: true
  validates :bottom_places, :top_places, :side_bottom_places, :side_top_places, absence: true

  def name
    I18n.t('admin.carriages.sedentary_name')
  end

end