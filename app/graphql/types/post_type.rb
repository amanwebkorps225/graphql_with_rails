# frozen_string_literal: true

module Types
  class PostType < Types::BaseObject
    field :id, Integer, null: false
    field :title, String, null: false
    field :body, String, null: false
    field :user_id, Integer, null: true 
  end
end
