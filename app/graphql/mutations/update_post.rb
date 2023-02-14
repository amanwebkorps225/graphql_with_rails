module Mutations
    class UpdatePost < Mutations::BaseMutation
      argument :id, ID, required: true
      argument :title, String, required: true
      argument :body, String, required: true
  
      field :post, Types::PostType, null: false
      field :errors, [String], null: false
      field :posts, [Types::PostType], null: false
  
      def resolve(id:, title:, body: nil)
        post = Post.find(id)
        if post.update(title: title, body: body)
          { post: post,
            posts: Post.all,    #show all data
            errors: []
          }
        else  
          { errors: post.errors.full_messages }
        end
  
      end
    end
  end
  
#   mutation {
#   updatePost(input: {id: 27, title: " Update title", body: "update body"}) {
#     post {
#       id
#       title
#       body
#     }
#     posts {
#       id
#       title
#       body
#     }
#     errors
#   }
# }
