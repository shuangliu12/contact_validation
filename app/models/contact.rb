class Contact < ActiveRecord::Base
  STATES = %w(MA AK AZ RI NH)

  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true
  validates :state, presence: true, inclusion: { in: STATES, message:"State must be real" }
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: /@/
  validates :notes, length: {maximum: 500, message:"Notes are too long (max 500 characters)"}

  def full_name
    [first_name, last_name].join(' ')
  end

  def location
    [city, state].join(', ')
  end

  def self.alphabetically
    order('LOWER(first_name) ASC')
  end
end
