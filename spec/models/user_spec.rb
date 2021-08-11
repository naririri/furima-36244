require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '内容に不備が無い場合' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@user).to be_valid
      end
    end

    context '内容に不備がある場合' do
      it 'nick_nameが空だと保存できないこと' do
        @user.nick_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end

      it 'last_nameが空だと保存できないこと' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字を入力してください")
      end

      it 'last_nameが全角でないと保存できないこと' do
        @user.last_name = 'tech'
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字は全角で入力してください')
      end

      it 'first_nameが空だと保存できないこと' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end

      it 'first_nameが全角でないと保存できないこと' do
        @user.first_name = 'tech'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前は全角で入力してください')
      end

      it 'reading_last_nameが空だと保存できないこと' do
        @user.reading_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字の読みがなを入力してください")
      end

      it 'reading_last_nameが全角カタカナでないと保存できないこと' do
        @user.reading_last_name = 'tech'
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字の読みがなは全角カタカナで入力してください')
      end

      it 'reading_first_nameが空だと保存できないこと' do
        @user.reading_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前の読みがなを入力してください")
      end

      it 'reading_first_nameが全角カタカナでないと保存できないこと' do
        @user.reading_first_name = 'tech'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前の読みがなは全角カタカナで入力してください')
      end

      it 'birthdayが空だと保存できないこと' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end

      it 'passwordが空だと保存できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end

      it 'passwordが６文字未満だと保存できないこと' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英数字混合６文字以上で入力してください')
      end

      it 'passwordが半角数字のみだと保存できないこと' do
        @user.password = '1234567'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英数字混合６文字以上で入力してください')
      end

      it 'passwordが半角英字のみだと保存できないこと' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英数字混合６文字以上で入力してください')
      end

      it 'passwordが全角英数字混合だと保存できないこと' do
        @user.password = 'ａｂｃ１２３'
        @user.password_confirmation = 'ａｂｃ１２３'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英数字混合６文字以上で入力してください')
      end

      it 'passwordが存在してもpassword_confirmationが空だと保存できないこと' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end

      it 'emailが空だと保存できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end

      it '重複したemailが存在する場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end

      it 'emailに@が含まれていないと保存できないこと' do
        @user.email = 'testtest.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
    end
  end
end
