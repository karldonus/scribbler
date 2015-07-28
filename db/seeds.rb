
Post.destroy_all
Comment.destroy_all

first_post  = Post.create(author: "Ned Flanders", post_content: "Howdy Ho, Neighbor!")
second_post = Post.create(author: "Bart Simpson", post_content: "I didn't do it!")

first_post.comments.create([
  {commenter: "sam", comment_content: "ROFL"}])

second_post.comments.create([
  {commenter: "tom", comment_content: "OMG"}])
