Category.create!(title: "Beauty", description: Faker::HarryPotter.quote)
Category.create!(title: "Relationships", description: Faker::HarryPotter.quote)
Category.create!(title: "Health", description: Faker::HarryPotter.quote)
Category.create!(title: "Fitness", description: Faker::HarryPotter.quote)
Category.create!(title: "Fashion", description: Faker::HarryPotter.quote)

category_array = Category.all

user_array = 10.times.collect do User.create!(email: Faker::Internet.safe_email, 
																							password: "password",
																							password_confirmation: "password") end

post_array = 20.times.collect do Post.create!(title: Faker::HarryPotter.location, 
																							body: Faker::HarryPotter.quote,
																							category_id: category_array.sample.id,
																							poster_id: user_array.sample.id ) end

# comment_array = 20.times.collect do Comment.create!(body: Faker::HarryPotter.quote,
# 																										commenter_id: user_array.sample.id,
# 																										commentable_id: post_array.sample.id) end
5.times do |i|
  Comment.create!(body: Faker::HarryPotter.quote, commenter_id: user_array.sample.id, commentable: post_array.sample)
  comment_array = Comment.all
  Comment.create!(body: Faker::HarryPotter.quote, commenter_id: user_array.sample.id, commentable: comment_array.sample)
end

# post_array.each do |post|
#   post.poster = user_array.sample
#   post.save
# end
# comment_array = 20.times.collect do Comment.create!(body: Faker::HarryPotter.quote,
# 																										commenter_id: user_array.sample.id,
# 																										commentable_id: comment_array.sample.id) end



# comment_array.each do |comment|
#   comment.commenter = user_array.sample
#   comment.post = post_array.sample
#   comment.save
# end