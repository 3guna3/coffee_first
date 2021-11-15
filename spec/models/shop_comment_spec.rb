require "rails_helper"

RSpec.describe ShopComment, type: :model do
  describe "バリデーションのチェック" do
    subject { shop_comment.valid? }

    context "データが条件を満たすとき" do
      let(:shop_comment) { build(:shop_comment) }
      it "保存できる" do
        expect(subject).to eq true
      end
    end

    context "contentが空のとき" do
      let(:shop_comment) { build(:shop_comment, content: "") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(shop_comment.errors.messages[:content]).to include "を入力してください"
      end
    end

    context "rateが設定されていない場合" do
      let(:shop_comment) { build(:shop_comment, rate: 0) }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(shop_comment.errors.messages[:rate]).to include "は1以上の値にしてください"
      end
    end
  end
end
