require "rails_helper"

RSpec.describe Shop, type: :model do
  describe "バリデーションのチェック" do
    subject { shop.valid? }

    context "データが条件を満たすとき" do
      let(:shop) { build(:shop) }
      it "保存できる" do
        expect(subject).to eq true
      end
    end

    context "nameが空のとき" do
      let(:shop) { build(:shop, name: "") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(shop.errors.messages[:name]).to include "を入力してください"
      end
    end

    context "prefectureが選択されていないとき" do
      let(:shop) { build(:shop, prefecture: 0) }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(shop.errors.messages[:prefecture]).to include "を選択してください"
      end
    end

    context "addressが入力されていないとき" do
      let(:shop) { build(:shop, address: "") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(shop.errors.messages[:address]).to include "を入力してください"
      end
    end
  end

  context "店舗が削除されたとき" do
    subject { shop.destroy }

    let(:shop) { create(:shop) }
    before do
      create_list(:bean, 2, shop: shop)
      create(:bean)
    end
    it "そのお店に紐づいているコーヒー豆も削除される" do
      expect { subject }.to change { shop.beans.count }.by(-2)
    end
  end
end
