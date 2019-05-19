# frozen_string_literal: true

class Meeting < ApplicationRecord
  belongs_to :user
  has_many :mutations, dependent: :destroy
end
