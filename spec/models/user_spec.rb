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

    context 'email must be unique and not case sensitive' do
      it 'should return false if email is dublicated' do
        @user = User.new({first_name:'Nahom', last_name: 'kibreab', email:'email@gmail.com', password:'password', password_confirmation: 'password'})
        @user.save
        @user2 = User.new({first_name:'first', last_name: 'last', email:'email@gmail.com', password:'password', password_confirmation: 'password'})
        expect(@user2.save).to be false
      end

      it 'should return false if email is not case sensitive' do
        @user = User.new({first_name:'first', last_name: 'last', email:'EMAIL@GMAIL.com', password:'password', password_confirmation: 'password'})
        @user.save
        @user2 = User.new({first_name:'Nahom', last_name: 'kibreab', email:'email@gmail.com', password:'password', password_confirmation: 'password'})
        expect(@user2.save).to be false
      end
    end

    context 'email,first_name,last_name need to be required' do
      it 'should return false if email is missed' do
        @user = User.new({first_name:'first', last_name: 'last', password:'password', password_confirmation: 'password'})
        expect(@user.save).to be false
      end
      it 'should return false if first_name is missed' do
        @user = User.new({last_name: 'last', email:'email@gmail.com', password:'password', password_confirmation: 'password'})
        expect(@user.save).to be false
      end
      it 'should return false if last_name is missed' do
        @user = User.new({first_name:'first', email:'email@gmail.com', password:'password', password_confirmation: 'password'})
        expect(@user.save).to be false
      end
    end
  end
end
