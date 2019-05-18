# frozen_string_literal: true

class Agreement < ApplicationRecord
  belongs_to :user
  belongs_to :mutation, dependent: :destroy
  enum status: %i[positive negative neutral]
end
