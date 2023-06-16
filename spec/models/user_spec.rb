require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Creating a User' do
    it 'should create correctly a user' do
      user = User.new(first_name: "firstname", last_name: "lastname", email:"rspec@test.fr", zip_code:"12345", password:"azerty", password_confirmation: "azerty", street:"Rue de la moule", city:"Rspec")
      user.save
      except(User.find_by(first_name: "rspectest").not_to be_nil)
    end

    it 'should have a valid email (have a @ and a .)' do
      user = User.new(email: 'test@example.com')
      expect(user).to be_valid
    end

    it 'should have a valid zipcode (Only numbers)' do
      user = User.new(zip_code: '12345')
      expect(user).to be_valid

      user.zip_code = 'ABC123'
      expect(user).not_to be_valid
    end

    it 'should have all info registered' do
      user = User.new(first_name: "rspectest", last_name: "rspectest", email:"rspec@test.fr", zip_code:"12345", password:"azerty", password_confirmation: "azerty", street:"Rue de la moule", city:"Rspec")
      expect(user).to be_valid
    end

    it 'should not have is_admin = true' do
      user = User.new()
      expect(user).to be_valid
      expect(user.is_admin).to be_falsey
    end
  end
  
  context 'Modifying works fine' do
    ### A contextualiser quand on aura une page user edit 
  end

  context ''

  it { should have_one(:carts) }
  end