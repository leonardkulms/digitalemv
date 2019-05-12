# frozen_string_literal: true

class Meeting < ApplicationRecord
  belongs_to :user

  has_many :agreements, dependent: :delete_all
  has_many :agreeing_users, through: :agreements, source: :user
end
