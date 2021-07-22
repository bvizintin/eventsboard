module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # /users
        field :users, [Types::UserType], null: false

        def users
          User.all
        end

        # /user/:id
        field :user, Types::UserType, null: false do
          argument :id, ID, required: true
        end

        def user(id:)
          User.find(id)
        end

    # /events---------- ovo sam ja dodao, ne znam jel potrebno
        field :events, [Types::EventType], null: false

        def events
          Event.all
        end

  end
end
