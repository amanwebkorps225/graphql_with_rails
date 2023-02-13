class Mutations::UpdateUser < Mutations::BaseMutation
  argument :id, ID, required: true
  argument :name, String, required: true
  argument :email, String, required: true

  field :user, Types::UserType, null: false
  field :errors, [String], null: false
  field :users, [Types::UserType], null: false

  def resolve(id:, name:, email: nil)
    user = User.find(id)
    if user.update(name: name, email: email)
      { user: user,
        users: User.all,    #showw all data
        errors: []
      }
    else  
      { errors: user.errors.full_messages }
    end

  end
end





# mutation {
#   updateUser(input: {id: 11, name: "Aman Update", email: "amanUpdate@gmail.com"}) {
#     user {
#       id
#       name
#       email
#     }
#     users {
#       id
#       name
#       email
#     }
#     errors
#   }
# }

