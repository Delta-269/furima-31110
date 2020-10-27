require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it '全項目が存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordは英字と数字が存在し６文字以上であれば登録できる' do
        @user.password = 's12345'
        @user.password_confirmation = 's12345'
        expect(@user).to be_valid
      end
    end
    context '新規登録がうまくいかないとき' do
      it 'nick_nameが空だと登録できない' do
        @user.nick_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nick name can't be blank")
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailは@を含まなければ登録できない' do
        @user.email = 'sampalesample.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordは英字を含めないと登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordは数字を含めないと登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = 's0000'
        @user.password_confirmation = 's0000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'name_zen_familyが全角でないと登録でない' do
        @user.name_zen_family = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name zen family is invalid')
      end
      it 'name_zen_firstが全角でないと登録できない' do
        @user.name_zen_first = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name zen first is invalid')
      end
      it 'name_han_familyが全角カナでないと登録できない' do
        @user.name_han_family = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name han family is invalid')
      end
      it 'name_han_firstが全角カナでないと登録できない' do
        @user.name_han_first = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name han first is invalid')
      end
      it 'birthdayが空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
