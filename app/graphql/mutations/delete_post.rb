module Mutations
    class DeletePost < Mutations::BaseMutation
        argument :id, ID, required: true        
        field :post, Types::PostType, null: false
        field :posts, [Types::PostType], null: false
        field :errors, [String], null: false 


        def resolve(id:)
            post = Post.find(id)
            if post.destroy
                { posts: Post.all,
                errors: []
                }
            else
                { errors: post.errors.full_messages }
            end
       end
    end
end