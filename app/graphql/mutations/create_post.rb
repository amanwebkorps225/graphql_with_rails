module Mutations
      class CreatePost < Mutations::BaseMutation
      
        argument :title, String, required: true
        argument :body, String, required: true
        argument :user_id, ID, required: false

        field :post, Types::PostType, null: false
        field :errors, [String], null: false 
    
        def resolve(title:, body:, user_id:)
          post = Post.new(title: title, body: body, user_id: user_id)
                if post.save
              {
                post: post,
                errors: []
              }
            else
              {
                post: nil,
                errors: user.errors.full_messages
              }
            end
        end
      end
end

#   mutation {
#   createPost(
#     input: {title: "Aman's post", body: "body of aman's post", userId: 12}
#   ) {
#     post {
#       title
#       body
#     }
#     errors
#   }
# }
