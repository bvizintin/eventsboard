module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :email, String, null: false
    field :first_name, String, null: true
    field :last_name, String, null: true
    field :username, String, null: true
    field :organization_name, String, null: true
    field :admin, Boolean, null: true
    field :events, [Types::EventType], null: true
    field :events_count, Integer, null: true

    def events_count
      object.events.size
    end
  end
end
