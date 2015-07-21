# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



# bookmarks need url, title , comment(optional), fav(optional)

Bookmark.create(
  url: "http://github.com",
  title: "Github",
  comment: "Git Init!"
)

Bookmark.create(
  url: "http://facebook.com",
  title: "Facebook",
  comment: "EVERYONE IS HAVING BABIES!"
)

Bookmark.create(
    url: "http://guides.rubyonrails.org.com",
    title: "Rails Guide",
    comment: "Check it out!",
    favorite: true
)
