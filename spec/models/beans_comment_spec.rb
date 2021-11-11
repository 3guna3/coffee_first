require "rails_helper"

RSpec.describe BeansComment, type: :model do
  describe "バリデーションのチェック" do
    subject { beans_comment.valid? }

    context "データが条件を満たすとき" do
      let(:beans_comment) { build(:beans_comment) }
      it "保存できる" do
        expect(subject).to eq true
      end
    end

    context "contentが空のとき" do
      let(:beans_comment) { build(:beans_comment, content: "") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(beans_comment.errors.messages[:content]).to include "を入力してください"
      end
    end

    context "bitternessの評価がない場合" do
      let(:beans_comment) { build(:beans_comment, bitterness: 0) }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(beans_comment.errors.messages[:bitterness]).to include "は1以上の値にしてください"
      end
    end

    context "acidityの評価がない場合" do
      let(:beans_comment) { build(:beans_comment, acidity: 0) }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(beans_comment.errors.messages[:acidity]).to include "は1以上の値にしてください"
      end
    end

    context "bodyの評価がない場合" do
      let(:beans_comment) { build(:beans_comment, body: 0) }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(beans_comment.errors.messages[:body]).to include "は1以上の値にしてください"
      end
    end
  end
end
