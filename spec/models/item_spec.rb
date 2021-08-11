require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '内容に不備が無い場合' do
      it '全ての内容が正しく入力・選択されていれば保存できること' do
        expect(@item).to be_valid
      end
    end

    context '内容に不備がある場合' do
      it 'imageが空だと保存できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像ファイルを入力してください")
      end

      it 'nameが空だと保存できないこと' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end

      it 'infoが空だと保存できないこと' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end

      it 'categoryが空だと保存できないこと' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
      end

      it 'category_idが1以外でないと保存できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
      end

      it 'conditionが空だと保存できないこと' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を入力してください")
      end

      it 'condition_idが1以外でないと保存できないこと' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を入力してください")
      end

      it 'postageが空だと保存できないこと' do
        @item.postage_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
      end

      it 'postage_idが1以外でないと保存できないこと' do
        @item.postage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
      end

      it 'prefectureが空だと保存できないこと' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を入力してください")
      end

      it 'prefecture_idが1以外でないと保存できないこと' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を入力してください")
      end

      it 'post_dateが空だと保存できないこと' do
        @item.post_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を入力してください")
      end

      it 'post_date_idが1以外でないと保存できないこと' do
        @item.post_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を入力してください")
      end

      it 'priceが空だと保存できないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格を入力してください")
      end

      it 'priceが300以下だと保存できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は範囲内で入力してください')
      end
      it 'priceが9999999以上だと保存できないこと' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は範囲内で入力してください')
      end

      it 'priceが全角数字だと保存できないこと' do
        @item.price = '３０００００'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は半角数字のみで入力してください')
      end

      it 'priceが半角英数字混合だと保存できないこと' do
        @item.price = '300abc'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は半角数字のみで入力してください')
      end
      it 'priceが半角英字のみだと保存できないこと' do
        @item.price = 'abcde'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は半角数字のみで入力してください')
      end
    end
  end
end
