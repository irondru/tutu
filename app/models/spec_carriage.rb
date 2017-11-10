class SpecCarriage < Carriage

  validates :bottom_places, presence: true
  validates :top_places, :side_bottom_places, :side_top_places, :sedentary_places, absence: true

  def name
    I18n.t('admin.carriages.spec_name')
  end

end