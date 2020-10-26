# Matchmaker is responsible for finding the items that two users are both "interested" in

class Matchmaker

  def initialize(user_one, user_two)
    @user_one = user_one
    @user_two = user_two
  end

  def find_matches
    user_one_interests = @user_one.interests
    user_two_interests = @user_two.interests
    shared_interest_ids = user_one_interests.pluck(:id) & user_two_interests.pluck(:id)
    Item.where(id: shared_interest_ids)
  end

end