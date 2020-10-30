require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の登録' do
    context '商品が登録できる場合' do
      it '全項目が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品が登録できない場合' do
      it 'imageが存在しなければ登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが存在しなければ登録できない' do
        @item.name = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'discriptionが存在しなければ登録できない' do
        @item.description = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'categoryを選択しなければ登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'categoryが空では登録できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", 'Category is not a number')
      end
      it 'statusを選択しなければ登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 1')
      end
      it 'statusが空では登録できない' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank", 'Status is not a number')
      end
      it 'burdenを選択しなければ登録できない' do
        @item.burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Burden must be other than 1')
      end
      it 'burdenが空では登録できない' do
        @item.burden_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden can't be blank", 'Burden is not a number')
      end
      it 'areaを選択しなければ登録できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Area must be other than 1')
      end
      it 'areaが空では登録できない' do
        @item.area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank", 'Area is not a number')
      end
      it 'dayを選択しなければ登録できない' do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Day must be other than 1')
      end
      it 'dayが空では登録できない' do
        @item.day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Day can't be blank", 'Day is not a number')
      end
      it 'priceが存在しなければ登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", 'Price is invalid', 'Price is not a number')
      end
      it 'priceは半角数字でなければ登録できない' do
        @item.price = ' ３００ '
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceは300以上でないと登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceは9_999_999以下でないと登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
    end
  end
end
