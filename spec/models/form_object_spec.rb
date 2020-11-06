require 'rails_helper'

RSpec.describe FormObject, type: :model do
  before do
    @form = FactoryBot.build(:form_object)
  end

  describe "商品の購入" do
    context "商品が購入できる場合" do
      it "building以外の項目が全て存在すれば購入できる" do
        expect(@form).to be_valid
      end
      context "商品購入ができない場合" do
        it "postが存在しなければ購入できない" do
          @form.post = nil
          @form.valid?
          expect(@form.errors.full_messages).to include("Post can't be blank")
        end
        it "postはハイフンがなければならない" do
          @form.post = "1234567"
          @form.valid?
          expect(@form.errors.full_messages).to include("Post is invalid. Include hyphen(-)")
        end
        it "areaを選択しなければ購入できない" do
          @form.area_id = 1
          @form.valid?
          expect(@form.errors.full_messages).to include("Area must be other than 1")
        end
        it "cityが存在しなければ購入できない" do
          @form.city = ""
          @form.valid?
          expect(@form.errors.full_messages).to include("City can't be blank")
        end
        it "addressが存在しなければ購入できない" do
          @form.address = ""
          @form.valid?
          expect(@form.errors.full_messages).to include("Address can't be blank")
        end
        it "phoneが存在しなければ購入できない" do
          @form.phone = nil
          @form.valid?
          expect(@form.errors.full_messages).to include("Phone can't be blank")
        end
        it "phoneは11桁以内であること" do
          @form.phone = "090123456789"
          @form.valid?
          expect(@form.errors.full_messages).to include("Phone is invalid")
        end
        it "tokenが空では登録できないこと" do
          @form.token = nil
          @form.valid?
          expect(@form.errors.full_messages).to include("Token can't be blank")
        end
      end
    end
  end
end
