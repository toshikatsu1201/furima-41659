require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '出品がうまくいくとき' do
      it 'すべての項目が正しく入力されていると保存できる' do
        expect(@item).to be_valid
      end
    end

    context '出品がうまくいかないとき' do
      it '商品画像が必須' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Image を添付してください')
      end

      it '商品名が必須であること' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end

      it '商品の説明が必須であること' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it 'カテゴリーの情報が必須であること' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category 選択してください")
      end

      it '商品の状態の情報が必須であること' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition 選択してください")
      end

      it '配送料の負担の情報が必須であること' do
        @item.cost_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost 選択してください")
      end

      it '発送元の地域の情報が必須であること' do
        @item.region_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Region 選択してください")
      end

      it '発送までの日数の情報が必須であること' do
        @item.schedule_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Schedule day 選択してください")
      end

      it '価格の情報が必須であること' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格が¥300未満では保存できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は¥300〜¥9,999,999の間で入力してください")
      end

      it '価格が¥10,000,000以上では保存できないこと' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は¥300〜¥9,999,999の間で入力してください")
      end

      it '価格は半角数値のみ保存可能であること' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は¥300〜¥9,999,999の間で入力してください")
      end

      it '出品者が紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
