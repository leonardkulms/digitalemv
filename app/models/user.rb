# frozen_string_literal: true

class User < ApplicationRecord
  has_many :meetings
  has_many :agreements
  has_many :agreed_meetings, through: :likes, source: :agreement
end
