class Ticket < ApplicationRecord

  belongs_to :first_station, class_name: 'RailwayStation', foreign_key: :first_station_id
  belongs_to :last_station, class_name: 'RailwayStation', foreign_key: :last_station_id
  belongs_to :train
  belongs_to :user

  validates :user, :train, :first_station, :last_station, presence: true
  validates :passport_number, format: {with: /\A\d{3,10}\z/}
  validates :first_name, :last_name, format: {with: /\A[ _\-a-zа-я]{3,42}\z/i}
  validate :check_ticket

  after_create :send_notification

  def check_ticket
    errors.add(:base, I18n.t('admin.tickets.errors.uniq')) if first_station == last_station
  end

  def send_notification
    TicketMailer.buy_ticket(user, self).deliver_now
  end

end