require "rails_helper"

RSpec.describe Bean, type: :model do
  describe "バリデーションのチェック" do
    subject { bean.valid? }

    context "データが条件を満たすとき" do
      let(:bean) { build(:bean, shop_id: 1) }
      before do
        create(:shop)
      end
      it "保存できる" do
        expect(subject).to eq true
      end
    end

    context "nameが空のとき" do
      let(:bean) { build(:bean, name: "") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(bean.errors.messages[:name]).to include "を入力してください"
      end
    end

    context "countryが選択されていないとき" do
      let(:bean) { build(:bean, country: 0) }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(bean.errors.messages[:country]).to include "を選択してください"
      end
    end

    context "priceが入力されていないとき" do
      let(:bean) { build(:bean, price: "") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(bean.errors.messages[:price]).to include "を入力してください"
      end
    end
  end

  context "コーヒー豆が削除されたとき" do
    subject { bean.destroy }

    let(:bean) { create(:bean) }
    before do
      create_list(:beans_comment, 2, bean: bean)
      create(:beans_comment)
    end
    it "そのユーザーがコーヒー豆に対して投稿したコメントが削除される" do
      expect { subject }.to change { bean.beans_comments.count }.by(-2)
    end
  end
end
