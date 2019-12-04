

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

=begin

comic_3 = creator1.comics.create!( title: 'Mutiny', comic_file: 'Mutiny.png', isbn: '35-2232-323-1', genre: "Action", user_id: 1)
comic_4 = creator2.comics.create!(title: 'Amazing Ghost Stories', comic_file: 'ags.png', isbn: '34-3302-323', genre: "Horror", user_id: 2)
comic_2 = creator3.create!(title: 'After Dark', comic_file: 'AfterDark.png', isbn: '10-892-4203', genre: "Crime", user_id: 3)

#comic_2 = Comic.create!(user: creator1, title: 'SpatMan', comic_file: 'file.pdf', isbn: '35-23232-323', genre: "Action")
#review_1 = Review.create!(user: critic1, comic: comic1, text: 'Amazing comic', rating: 5, replied_to: nil)
=end
t2 = User.create!(username: 'test', password: 'test', password_confirmation: 'test', email: 'test', group: 'fan')
t3 = User.create!(username: 'creator', password: 'creator', password_confirmation: 'creator', email: 'creator', group: 'creator')

u1 = User.create!(username: 'admin', password: 'admin', password_confirmation: 'admin', email: 'admin', group: 'admin')
s1 = Series.create!(title: 'not', user_id: u1.id)

u2 = User.create!(username: 'honor_oconnor', password: 'conor', password_confirmation: 'conor', email: 'honor_oconnor@yahoo.com', group: 'creator')
s2 = Series.create!(title: 'The Adventures of Captain Havoc and the Phantom Knight', user_id: u2.id)
c2 = Comic.create!(title: 'The Adventures of Captain Havoc and the Phantom Knight #4', genre: 'Superhero', category: 'series', user_id: u2.id, series_id: s2.id )
c2.cover_file.attach(io: File.open('app/assets/images/0/0_1.jpg'), filename: '0_1.jpg', content_type: 'image/jpg')
for i in 2..28 do
    y = i.to_s + '.jpg'
    x = 'app/assets/images/0/0_' + y
    c2.comic_file.attach(io: File.open(x), filename: y, content_type: 'image/jpg')
end

u3 = User.create!(username: 'bakerthemaker', password: 'maker', password_confirmation: 'maker', email: 'bakerthemaker@yahoo.com', group: 'creator')
c3 = Comic.create!(title: 'Aguila Negra', genre: 'Superhero', category: 'one-shot', user_id: u3.id, series_id: s1.id )
c3.cover_file.attach(io: File.open('app/assets/images/1/0_1.jpg'), filename: '0_1.jpg', content_type: 'image/jpg')
for i in 2..13 do
    y = i.to_s + '.jpg'
    x = 'app/assets/images/1/0_' + y
    c3.comic_file.attach(io: File.open(x), filename: y, content_type: 'image/jpg')
end

u4 = User.create!(username: 'BEATNGU', password: 'beatngu', password_confirmation: 'beatngu', email: 'beatenu@yahoo.com', group: 'creator',
bio: "I am a collector. I look for the best items that I have taken a liking to. I am a great people person. I am a connoisseur of good food. My favorite form of transportation is flight.")
s4 = Series.create!(title: 'Apache', user_id: u4.id)
c4 = Comic.create!(title: 'Apache #1', genre: 'Western', category: 'series', user_id: u4.id, series_id: s4.id )
c4.cover_file.attach(io: File.open('app/assets/images/2/0_1.jpg'), filename: '0_1.jpg', content_type: 'image/jpg')
for i in 2..12 do
    y = i.to_s + '.jpg'
    x = 'app/assets/images/2/0_' + y
    c4.comic_file.attach(io: File.open(x), filename: y, content_type: 'image/jpg')
end

u5 = User.create!(username: 'blinddrunkantonina', password: 'drunk', password_confirmation: 'drunk', email: 'blinddrunkantonina@yahoo.com', group: 'creator')
s5 = Series.create!(title: 'Aventuras de Buffalo Bill', user_id: u5.id)
c5 = Comic.create!(title: 'Aventuras de Buffalo Bill #1 El pequeño Bill	', genre: 'Western', category: 'series', user_id: u5.id, series_id: s5.id )
c5.cover_file.attach(io: File.open('app/assets/images/3/0_1.jpg'), filename: '0_1.jpg', content_type: 'image/jpg')
for i in 2..12 do
    y = i.to_s + '.jpg'
    x = 'app/assets/images/3/0_' + y
    c5.comic_file.attach(io: File.open(x), filename: y, content_type: 'image/jpg')
end

u6 = User.create!(username: 'millstheskills', password: 'skills', password_confirmation: 'skills', email: 'millstheskills@yahoo.com', group: 'creator')
s6 = Series.create!(title: 'All Fun Comic', user_id: u6.id)
c6 = Comic.create!(title: 'All Fun Comic #1', genre: 'Humor', category: 'series', user_id: u6.id, series_id: s6.id )
c6.cover_file.attach(io: File.open('app/assets/images/4/0_1.jpg'), filename: '0_1.jpg', content_type: 'image/jpg')
for i in 2..4 do
    y = i.to_s + '.jpg'
    x = 'app/assets/images/4/0_' + y
    c6.comic_file.attach(io: File.open(x), filename: y, content_type: 'image/jpg')
end

u7 = User.create!(username: 'cherryperry', password: 'perry', password_confirmation: 'perry', email: 'cherryperry@yahoo.com', group: 'creator')
s7 = Series.create!(title: 'All Star Comic', user_id: u7.id)
c7 = Comic.create!(title: 'All Star Comic #1', genre: 'Humor', category: 'series', user_id: u7.id, series_id: s7.id )
c7.cover_file.attach(io: File.open('app/assets/images/5/0_1.jpg'), filename: '0_1.jpg', content_type: 'image/jpg')
for i in 2..16 do
    y = i.to_s + '.jpg'
    x = 'app/assets/images/5/0_' + y
    c7.comic_file.attach(io: File.open(x), filename: y, content_type: 'image/jpg')
end

u8 = User.create!(username: 'coolthesoul', password: 'soul', password_confirmation: 'soul', email: 'coolthesoul@yahoo.com', group: 'creator')
s8 = Series.create!(title: 'Adventures', user_id: u8.id)
c8 = Comic.create!(title: 'Adventures #1', genre: 'Non-ficton', category: 'series', user_id: u8.id, series_id: s8.id )
c8.cover_file.attach(io: File.open('app/assets/images/6/0_1.jpg'), filename: '0_1.jpg', content_type: 'image/jpg')
for i in 2..16 do
    y = i.to_s + '.jpg'
    x = 'app/assets/images/6/0_' + y
    c8.comic_file.attach(io: File.open(x), filename: y, content_type: 'image/jpg')
end

u9 = User.create!(username: 'springwood', password: 'cutter', password_confirmation: 'cutter', email: 'springwood@yahoo.com', group: 'creator',
bio: "I am a butcher. I'm a big dreamer ,so people say I chase dreams. My hobby is hunting. I love a chase.")
s9 = Series.create!(title: 'Atomic', user_id: u9.id)
c9 = Comic.create!(title: 'Atomic #1', genre: 'Non-ficton', category: 'series', user_id: u9.id, series_id: s9.id )
c9.cover_file.attach(io: File.open('app/assets/images/7/0_1.jpg'), filename: '0_1.jpg', content_type: 'image/jpg')
for i in 2..16 do
    y = i.to_s + '.jpg'
    x = 'app/assets/images/7/0_' + y
    c9.comic_file.attach(io: File.open(x), filename: y, content_type: 'image/jpg')
end

u10 = User.create!(username: 'michaelthemotorcycle', password: 'motor', password_confirmation: 'motor', email: 'michaelthemotorcycle@yahoo.com', group: 'creator')
s10 = Series.create!(title: 'The Adventures of Peter Wheat', user_id: u10.id)
c10 = Comic.create!(title: 'The Adventures of Peter Wheat #0', genre: 'Fantasy', category: 'series', user_id: u10.id, series_id: s10.id )
c10.cover_file.attach(io: File.open('app/assets/images/8/0_1.jpg'), filename: '0_1.jpg', content_type: 'image/jpg')
for i in 2..4 do
    y = i.to_s + '.jpg'
    x = 'app/assets/images/8/0_' + y
    c10.comic_file.attach(io: File.open(x), filename: y, content_type: 'image/jpg')
end
c010 = Comic.create!(title: 'The Adventures of Peter Wheat #1', genre: 'Fantasy', category: 'series', user_id: u10.id, series_id: s10.id )
c010.cover_file.attach(io: File.open('app/assets/images/8/1_1.jpg'), filename: '1_1.jpg', content_type: 'image/jpg')
for i in 2..16 do
    y = i.to_s + '.jpg'
    x = 'app/assets/images/8/1_' + y
    c010.comic_file.attach(io: File.open(x), filename: y, content_type: 'image/jpg')
end

u11 = User.create!(username: 'forgegeorge', password: 'forge', password_confirmation: 'forge', email: 'forgegeorge@yahoo.com', group: 'creator')
s11 = Series.create!(title: 'El Duende', user_id: u11.id)
c11 = Comic.create!(title: 'El Duende #1', genre: 'Fantasy', category: 'series', user_id: u11.id, series_id: s11.id )
c11.cover_file.attach(io: File.open('app/assets/images/9/0_1.jpg'), filename: '0_1.jpg', content_type: 'image/jpg')
for i in 2..12 do
    y = i.to_s + '.jpg'
    x = 'app/assets/images/9/0_' + y
    c11.comic_file.attach(io: File.open(x), filename: y, content_type: 'image/jpg')
end

u12 = User.create!(username: 'flatmatt', password: 'matt', password_confirmation: 'matt', email: 'flatmatt@yahoo.com', group: 'creator')
s12 = Series.create!(title: 'Beware', user_id: u12.id)
c12 = Comic.create!(title: 'Beware #1', genre: 'Horror', category: 'series', user_id: u12.id, series_id: s12.id )
c12.cover_file.attach(io: File.open('app/assets/images/10/0_1.jpg'), filename: '0_1.jpg', content_type: 'image/jpg')
for i in 2..28 do
    y = i.to_s + '.jpg'
    x = 'app/assets/images/10/0_' + y
    c12.comic_file.attach(io: File.open(x), filename: y, content_type: 'image/jpg')
end

u13 = User.create!(username: 'brainlessmarcello', password: 'brain', password_confirmation: 'brain', email:'brainlessmarcello@yahoo.com', group: 'creator')
s13 = Series.create!(title: 'Startling Terror Tales', user_id: u13.id)
c13 = Comic.create!(title: 'Startling Terror Tales #1', genre: 'Horror', category: 'series', user_id: u13.id, series_id: s13.id )
c13.cover_file.attach(io: File.open('app/assets/images/11/0_1.jpg'), filename: '0_1.jpg', content_type: 'image/jpg')
for i in 2..29 do
    y = i.to_s + '.jpg'
    x = 'app/assets/images/11/0_' + y
    c13.comic_file.attach(io: File.open(x), filename: y, content_type: 'image/jpg')
end

u14 = User.create!(username: 'nellythedeli', password: 'deli', password_confirmation: 'deli', email:'nellythedeli@yahoo.com', group: 'creator')
s14 = Series.create!(title: "Bride's Secrets", user_id: u14.id)
c14 = Comic.create!(title: "Bride's Secrets #2", genre: 'Other', category: 'series', user_id: u14.id, series_id: s14.id )
c14.cover_file.attach(io: File.open('app/assets/images/12/0_1.jpg'), filename: '0_1.jpg', content_type: 'image/jpg')
for i in 2..23 do
    y = i.to_s + '.jpg'
    x = 'app/assets/images/12/0_' + y
    c14.comic_file.attach(io: File.open(x), filename: y, content_type: 'image/jpg')
end

u15 = User.create!(username: 'spellpatel', password: 'patel', password_confirmation: 'patel', email:'spellpatel@yahoo.com', group: 'creator')
s15 = Series.create!(title: "Battle Cry", user_id: u15.id)
c15 = Comic.create!(title: "Battle Cry #2", genre: 'Other', category: 'series', user_id: u15.id, series_id: s15.id )
c15.cover_file.attach(io: File.open('app/assets/images/13/0_1.jpg'), filename: '0_1.jpg', content_type: 'image/jpg')
for i in 2..27 do
    y = i.to_s + '.jpg'
    x = 'app/assets/images/13/0_' + y
    c15.comic_file.attach(io: File.open(x), filename: y, content_type: 'image/jpg')
end
