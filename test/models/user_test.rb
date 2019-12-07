require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup 
  	@user = User.new(username: 'Example', email: 'example@foo.com', password_digest: '$foobar12', password_confirmation: '$foobar12')
  end
  
  test 'should be valid' do
  	@user.valid?
  end
  
  test 'Username should be present' do
  	@user.username =''
  	assert_not @user.valid?
  end
  
  test 'Username should be 1 word' do
  	@user.username = 'Vedant Shetty'
  	assert_not @user.valid?
  end
  
  test 'username should be unique' do
  	duplicate_user = @user.dup
  	duplicate_user.username = @user.username
  	@user.save
  	assert_not duplicate_user.valid? 
  end
  
  test 'username should not be too long' do
  	@user.username = 'a'*255
  	assert_not @user.valid?
  end
  
  test 'password should be at least 8 characters long' do 
  	@user.password_digest = @user.password_confirmation = '$'+'a'*3
  	assert_not @user.valid?
  end
  
  test 'password should have at least 1 special character' do 
  	@user.password_digest = 'password'
  	assert_not @user.valid?
  end
  
  test 'password should be present' do
  	@user.password_digest = ''
  	assert_not @user.valid? 
  end
  
  test 'email should accept valid addresses' do 
  	valid = %w[vshetty.vs@gmail.com vedant@sitpune.edu.in block@chain.org]
  	valid.each do |valid_address|
  		@user.email = valid_address
  		assert @user.valid?, "#{valid_address.inspect} should be valid"
  	end
  end
  
  
  test 'email should reject invalid addresses' do
  	invalid = %w[vedant@example,com gsg gf_.ggg.rf foo@bar_bax.com foo@bar+box.com]
  	invalid.each do |invalid_address|
  		@user.email = invalid_address
  		assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
  	end
  end
  

end
