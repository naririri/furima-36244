require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入機能' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に不備が無い場合' do
      it '全ての内容が正しく入力・選択されていれば購入できること' do
        expect(@order_address).to be_valid
      end

      it 'buildingは空でも購入できること' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context '内容に不備がある場合' do
      it "tokenが空では登録できないこと" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'postal_numberが空だと購入できないこと' do
        @order_address.postal_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal number can't be blank")
      end

      it 'postal_numberにハイフンが無いと購入できないこと' do
        @order_address.postal_number = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal number is invalid")
      end

      it 'postal_numberが全角数字だと購入できないこと' do
        @order_address.postal_number = '１２３-４５６７'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal number is invalid")
      end

      it 'prefectureが空だと購入できないこと' do
        @order_address.prefecture_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'prefecture_idが1以外でないと保存できないこと' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空だと購入できないこと' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numberが空だと購入できないこと' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end

      it 'mobile_numberが空だと購入できないこと' do
        @order_address.mobile_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Mobile number can't be blank")
      end

      it 'mobile_numberがハイフン有りだと購入できないこと' do
        @order_address.mobile_number = '090-8765-4321'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Mobile number is invalid")
      end

      it 'mobile_numberが９桁だと購入できないこと' do
        @order_address.mobile_number = '090123456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Mobile number is invalid")
      end

      it 'mobile_numberが１２桁だと購入できないこと' do
        @order_address.mobile_number = '090987654321'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Mobile number is invalid")
      end

      it 'mobile_numberが全角数字だと購入できないこと' do
        @order_address.mobile_number = '０９０１２３４５６７８'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Mobile number is invalid")
      end

    end
  end
end
