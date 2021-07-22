module Types
  class EventType < Types::BaseObject
    field :id, Integer, null: false             #ovdje sam umjesto ID stavio Integer
    field :title, String, null: true
    field :description, String, null: true
    field :start_date, GraphQL::Types::ISO8601DateTime, null: true
    field :end_date, GraphQL::Types::ISO8601DateTime, null: true
    field :venue, String, null: true
    field :location, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :user_id, Integer, null: true
    field :image, String, null: true
    field :slug, String, null: true
    field :category_id, Integer, null: true
    field :seats, Integer, null: true
  end
end
