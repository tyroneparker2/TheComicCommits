

=begin

fan1 = Fan.create!(username: 'ab', email: 'ab@email.com', password: 'ab123', 
security_q: 'What is your favorite animal?', security_a: 'Kangaroo', bio: 'I like comics',
recommendations: 'nil', admin_code: 'nil')

critic1 = Critic.create!(username: 'mrcritic', email: 'critic@email.com', password: 'abc123', 
security_q: 'What is your favorite animal?', security_a: 'Grizzly', bio: 'I like good comics',
recommendations: 'Batman', admin_code: 'nil')

admin1 = Admin.create!(username: 'mradmin', email: 'badmin@email.com', password: 'abc123', 
security_q: 'What is your favorite animal?', security_a: 'Sponge', bio: 'I like monitor comics',
recommendations: 'nil', admin_code: '12345')

creator1 = Creator.create!(username: 'mrcreator', email: 'creator@email.com', password: 'abc123', 
security_q: 'What is your favorite animal?', security_a: 'Bee', bio: 'I like make comics',
recommendations: 'nil', admin_code: 'nil')
y 

forum_post_1 = Forum.create!(text: 'Anyone read xyz?', rating: nil, replied_to: nil)
comment_1 = Comment.create!(text: 'Anyone read xyz?', rating: nil, replied_to: '12345')
review_1 = Review.create!(text: 'Anyone read xyz?', rating: 5, replied_to: nil)

comic_1 = Comic.create!(title: 'Anyone read xyz?', comic_file: 'file.pdf', isbn: '35-23232-323', genre: "Action")

=end
comic_2 = Comic.create!(user: creator1, title: 'SpatMan', comic_file: 'file.pdf', isbn: '35-23232-323', genre: "Action")
review_1 = Review.create!(user: critic1, comic: comic1, text: 'Amazing comic', rating: 5, replied_to: nil)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
q1 = User.create!(username: 'admimn', password: 'admin', email: 'admin', form: 'admin')
q2 = User.create!(username: 'test', password: 'test', email: 'test', form: 'fan')
