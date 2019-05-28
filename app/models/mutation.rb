# frozen_string_literal: true

class Mutation < ApplicationRecord
  belongs_to :meeting
  has_many :agreements, dependent: :delete_all
end
