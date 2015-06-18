class Field < ActiveRecord::Base
  belongs_to :account

  FIELD_TYPES = %w(small long textarea)
  DATA_TYPES = %w(text integer boolean datetime)

  validates :name, presence: true
  validates :field_type, inclusion: {in: FIELD_TYPES}
  validates :data_type, inclusion: {in: DATA_TYPES}
end
