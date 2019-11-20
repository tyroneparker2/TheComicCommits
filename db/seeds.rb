

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
#comic_2 = Comic.create!(user: creator1, title: 'SpatMan', comic_file: 'file.pdf', isbn: '35-23232-323', genre: "Action")
#review_1 = Review.create!(user: critic1, comic: comic1, text: 'Amazing comic', rating: 5, replied_to: nil)
q1 = User.create!(username: 'admin', password: 'admin', password_confirmation: 'admin', email: 'admin', group: 'admin')
q2 = User.create!(username: 'test', password: 'test', password_confirmation: 'test', email: 'test', group: 'fan')
