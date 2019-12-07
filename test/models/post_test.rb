require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
def setup
  @post = Post.new(title: 'Lebron James Joins LA Lakers', content: 'Lebron James leaves the cavs for the city of angels', user_id: 1)
end

test 'post title must not be empty' do
  @post.title = ''
  assert_not @post.valid?
end

test 'user_id must point to a valid user' do
  @post.user_id = -1
  assert_not @post.valid?
end


end
