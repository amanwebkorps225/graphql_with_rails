
module Types
  class QueryType < Types::BaseObject
    field :users, [Types::UserType], null: false
    field :posts, [Types::PostType], null: false
    field :user, Types::UserType, null: false do
      argument :id, ID, required: true
    end
    field :post, Types::PostType, null: false do
      argument :id, ID, required: true
    end

    def users
      User.all
    end

    def user(id:)
      User.find(id)
    end
 
    def posts
      Post.all
    end

    def post(id:)
      Post.find(id)
    end

  end
end

# query {
#   users {
#     name
#     email
#     postsCount
#   }
# }




# {
#   posts {
#     id
#     title
#     body
#     userId
#   }
# }

# {
#   post(id: 25) {
#     id
#     title
#     body
#     userId
#   }
# }



