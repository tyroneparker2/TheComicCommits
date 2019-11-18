

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

comic_2 = Comic.create!(user: creator21, title: 'SpatMan', comic_file: 'file.pdf', isbn: '35-23232-323', genre: "Action")
review_1 = Review.create!(user: critic21, comic: comic1, text: 'Amazing comic', rating: 5, replied_to: nil)

=end


=begin
creator1 = Creator.create!(username: 'mrcreator', email: 'creator@email.com', password: 'abc123', 
security_q: 'What is your favorite animal?', security_a: 'Squid', bio: 'I like make comics',
recommendations: 'nil', admin_code: 'nil')
creator2 = Creator.create!(username: 'mscreator', email: 'creator@gmail.com', password: 'abc123', 
security_q: 'What is your favorite animal?', security_a: 'Camel', bio: 'I like make comics',
recommendations: 'nil', admin_code: 'nil')
creator3 = Creator.create!(username: 'brercreator', email: 'creator@yahoo.com', password: 'abc123', 
security_q: 'What is your favorite animal?', security_a: 'Bee', bio: 'I like make comics',
recommendations: 'nil', admin_code: 'nil')
=end



comic_3 = creator1.comics.create!( title: 'Mutiny', comic_file: 'Mutiny.png', isbn: '35-2232-323-1', genre: "Action", user_id: 1)
comic_4 = creator2.comics.create!(title: 'Amazing Ghost Stories', comic_file: 'ags.png', isbn: '34-3302-323', genre: "Horror", user_id: 2)
comic_2 = creator3.create!(title: 'After Dark', comic_file: 'AfterDark.png', isbn: '10-892-4203', genre: "Crime", user_id: 3)

