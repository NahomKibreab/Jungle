require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    context 'password and password_confirmation' do
      it ('should return true if both field are equal') do
        @user = User.new({first_name:'Nahom', last_name: 'kibreab', email:'email@gmail.com', password:'password', password_confirmation: 'password'})
        expect(@user.save).to be true
      end

      it ('should return false if both field are equal') do
        @user = User.new({first_name:'Nahom', last_name: 'kibreab', email:'email@gmail.com', password:'password1', password_confirmation: 'password'})
        expect(@user.save).to be false
      end

      it ('should return false if ethier password is missed') do
        @user = User.new({first_name:'Nahom', last_name: 'kibreab', email:'email@gmail.com', password_confirmation: 'password'})
        expect(@user.save).to be false
      end
    end
  end
end
