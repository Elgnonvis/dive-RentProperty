class Property < ApplicationRecord
    validates :name, presence: true
    validates :address, presence: true
    validates :rent, presence: true
    validates :age, presence: true
    validates :remark, presence: true
    has_many :stations, dependent: :destroy
    accepts_nested_attributes_for :stations, reject_if: :all_blank
    # accepts_nested_attributes_for :stations
    # accepts_nested_attributes_for :stations, reject_if: :all_blank, allow_destroy: true
end
