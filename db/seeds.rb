user3 = User.create!(name: 'Bob',
                    email: 'bob@example.com',
                    password: 'hamburger',
                    password_confirmation: 'hamburger')
user4 = User.create!(name: 'Sue',
                    email: 'sue@example.com',
                    password: 'hamburger',
                    password_confirmation: 'hamburger')
user5 = User.create!(name: 'John',
                    email: 'john@example.com',
                    password: 'hamburger',
                    password_confirmation: 'hamburger')
users = User.all

topicA = Topic.create!(title: 'Craft Sites',
                        user: users.sample)
topicB = Topic.create!(title: 'More Craft Sites',
                        user: users.sample)
topicC = Topic.create!(title: 'Even More Craft Sites',
                        user: users.sample)
topics = Topic.all

bookmarkA = Bookmark.create!(url: 'http://craftgawker.com/',
                            topic: topics.sample,
                            user: users.sample)
bookmarkB = Bookmark.create!(url: 'http://makezine.com/craftzine/',
                            topic: topics.sample,
                            user: users.sample)
bookmarkC = Bookmark.create!(url: 'http://totallytutorials.blogspot.com/',
                            topic: topics.sample,
                            user: users.sample)
bookmarkD = Bookmark.create!(url: 'http://knitty.com/ISSUEss15/index.php',
                            topic: topics.sample,
                            user: users.sample)
bookmarkE = Bookmark.create!(url: 'http://www.vogueknitting.com/',
                            topic: topics.sample,
                            user: users.sample)
bookmarkF = Bookmark.create!(url: 'http://www.craftsy.com/',
                            topic: topics.sample,
                            user: users.sample)
bookmarkG = Bookmark.create!(url: 'http://www.needlepoint.com/',
                            topic: topics.sample,
                            user: users.sample)
bookmarkH = Bookmark.create!(url: 'http://www.oregonpatchworks.com/',
                            topic: topics.sample,
                            user: users.sample)
bookmarkI = Bookmark.create!(url: 'http://www.olde-worlde-embroidery.com/',
                            topic: topics.sample,
                            user: users.sample)

puts "Seeds finished"
puts "#{User.count} Users created"
puts "#{Topic.count} Topics created"
puts "#{Bookmark.count} Bookmarks created"

