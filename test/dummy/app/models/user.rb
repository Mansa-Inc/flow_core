# frozen_string_literal: true

class User < ApplicationRecord
  has_many :notifications, dependent: :delete_all

  validates :name, presence: true
end
