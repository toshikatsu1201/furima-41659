# spec/models/ship_record_spec.rb

require 'rails_helper'

RSpec.describe ShipRecord, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @ship_record = FactoryBot.build(:ship_record, user_id: user.id, item_id: item.id)
  end

  describe '配送先情報の保存' do
    context '内容に問題がない場合' do
      it "priceとtokenがあれば保存ができること" do
        expect(@ship_record).to be_valid
      end

      it '全ての値が正しく入力されていれば保存できること' do
        expect(@ship_record).to be_valid
      end

      it '建物名が空でも保存できること' do
        @ship_record.building = ''
        expect(@ship_record).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号が空では保存できないこと' do
        @ship_record.post_code = ''
        @ship_record.valid?
        expect(@ship_record.errors.full_messages).to include("Post code can't be blank")
      end

      it '郵便番号が半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @ship_record.post_code = '1234567'
        @ship_record.valid?
        expect(@ship_record.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end

      it '都道府県が空では保存できないこと' do
        @ship_record.region_id = 0
        @ship_record.valid?
        expect(@ship_record.errors.full_messages).to include("Region can't be blank")
      end

      it '市区町村が空では保存できないこと' do
        @ship_record.city = ''
        @ship_record.valid?
        expect(@ship_record.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空では保存できないこと' do
        @ship_record.house_number = ''
        @ship_record.valid?
        expect(@ship_record.errors.full_messages).to include("House number can't be blank")
      end

      it '電話番号が空では保存できないこと' do
        @ship_record.tel = ''
        @ship_record.valid?
        expect(@ship_record.errors.full_messages).to include("Tel can't be blank")
      end

      it '電話番号が9桁以下では保存できないこと' do
        @ship_record.tel = '123456789'
        @ship_record.valid?
        expect(@ship_record.errors.full_messages).to include("Tel is invalid. Input only numbers")
      end

      it '電話番号が12桁以上では保存できないこと' do
        @ship_record.tel = '123456789012'
        @ship_record.valid?
        expect(@ship_record.errors.full_messages).to include("Tel is invalid. Input only numbers")
      end

      it '電話番号にハイフンが含まれていると保存できないこと' do
        @ship_record.tel = '090-1234-5678'
        @ship_record.valid?
        expect(@ship_record.errors.full_messages).to include("Tel is invalid. Input only numbers")
      end

      it 'user_idが空では保存できないこと' do
        @ship_record.user_id = nil
        @ship_record.valid?
        expect(@ship_record.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では保存できないこと' do
        @ship_record.item_id = nil
        @ship_record.valid?
        expect(@ship_record.errors.full_messages).to include("Item can't be blank")
      end

      it 'tokenが空では保存できないこと' do
        @ship_record.token = ''
        @ship_record.valid?
        expect(@ship_record.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
