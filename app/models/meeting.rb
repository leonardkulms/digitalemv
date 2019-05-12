# frozen_string_literal: true

class Meeting < ApplicationRecord
  belongs_to :user

  has_many :agreements
  has_many :agreeing_users, through: :agreements, source: :user
end
