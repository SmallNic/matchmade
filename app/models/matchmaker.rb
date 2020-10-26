class Matchmaker

  def find_matches
    user1 = User.find_by(email: "user1@example.com")
    user1_interests = user1.interests

    user2 = User.find_by(email: "user2@example.com")
    user2_interests = user2.interests

    shared_interest_ids = user1_interests.pluck(:id) & user2_interests.pluck(:id)
    Item.where(id: shared_interest_ids)
  end

end