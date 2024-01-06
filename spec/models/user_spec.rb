require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  # 新規登録画面

  # 成功パターン
  describe 'ユーザー新規登録' do
    context '新規登録成功' do
      it '全ての項目の入力が存在すれば登録できること' do
        expect(@user).to be_valid
      end
    end

    context '新規登録失敗' do
      # ネーム
      it 'nameが空欄では登録できないこと' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Name can't be blank"
      end
      # email
      it 'emailが空欄では登録できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it 'emailが登録済みの場合は登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailに@を含まない場合は登録できないこと' do
        @user.email = 'test111'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end

      # パスワード
      it 'passwordが空欄では登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank", "Password confirmation doesn't match Password",
                                                      'Password is invalid'
      end

      it 'passwordが６文字以下では登録できないこと' do
        @user.password = 'a'
        @user.password_confirmation = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)', 'Password is invalid'
      end

      it 'passwordとassword_confirmationが不一致の場合は登録できないこと' do
        @user.password = 'aaa111'
        @user.password_confirmation = 'bbb111'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it 'password_confirmationが空欄では登録できないこと' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
    end
  end
end
