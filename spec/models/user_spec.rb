require "rails_helper"

RSpec.describe User, type: :model do
  describe "バリデーションのチェック" do
    subject { user.valid? }

    context "データが条件を満たすとき" do
      let(:user) { build(:user) }
      it "保存できる" do
        expect(user.valid?).to eq true
      end
    end

    context "nameが31文字以上のとき" do
      let(:user) { build(:user, name: "a" * 31) }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(user.errors.messages[:name]).to include "は30文字以内で入力してください"
      end
    end

    context "nameが空の時" do
      let(:user) { build(:user, name: "") }
      it "エラーが発生する" do
        expect(user.valid?).to eq false
        expect(user.errors.messages[:name]).to include "を入力してください"
      end
    end

    context "self_introductionが500文字以上の時" do
      let(:user) { build(:user, self_introduction: "a" * 501) }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(user.errors.messages[:self_introduction]).to include "は500文字以内で入力してください"
      end
    end

    context "emailが空の時" do
      let(:user) { build(:user, email: "") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(user.errors.messages[:email]).to include "を入力してください"
      end
    end

    context "emailがすでに存在する時" do
      before { create(:user, email: "test@example.com") }
      let(:user) { build(:user, email: "test@example.com") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(user.errors.messages[:email]).to include "はすでに存在します"
      end
    end

    context "emailがアルファベット・英数字のみの時" do
      let(:user) { build(:user, email: Faker::Lorem.characters(number: 16)) }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(user.errors.messages[:email]).to include "は不正な値です"
      end
    end

    context "ユーザーが削除された時" do
      subject { user.destroy }

      let(:user) { create(:user) }
      before do
        create_list(:shop, 2, user: user)
        create_list(:bean, 3, user: user)
        create_list(:beans_comment, 4, user: user)
        create_list(:shop_comment, 5, user: user)
        create(:shop)
        create(:bean)
        create(:beans_comment)
        create(:shop_comment)
      end
      it "そのユーザーが登録した店舗も削除される" do
        expect { subject }.to change { user.shops.count }.by(-2)
      end
      it "そのユーザーが登録したコーヒー豆も削除される" do
        expect { subject }.to change { user.beans.count }.by(-3)
      end
      it "そのユーザーが店舗に対して投稿したコメントが削除される" do
        expect { subject }.to change { user.shop_comments.count }.by(-5)
      end
      it "そのユーザーがコーヒー豆に対して投稿したコメントが削除される" do
        expect { subject }.to change { user.beans_comments.count }.by(-4)
      end
    end
  end
end
