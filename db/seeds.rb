Review.destroy_all
Item.destroy_all
User.destroy_all

user1 = User.create(email: 'user1@example.com', name: 'User One', password: "userone")
user2 = User.create(email: 'user2@example.com', name: 'User Two', password: "usertwo")

item1 = Item.create(
  title: 'Sample Podcast Title',
  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi id.',
  category: 'Podcast',
  pub_date: 'Jan 1, 2020',
  media_url: 'https://podcasturl.com',
)

review1 = Review.create(
  item_id: item1.id,
  user_id: user1.id,
  is_interested: true
)

review2 = Review.create(
  item_id: item1.id,
  user_id: user2.id,
  is_interested: true
)