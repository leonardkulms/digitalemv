# frozen_string_literal: true

class Meeting < ApplicationRecord
  belongs_to :user
  has_many :mutations, dependent: :delete_all
  accepts_nested_attributes_for :mutations, allow_destroy: true
end
