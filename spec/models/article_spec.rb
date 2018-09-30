
RSpec.describe Article, type: :model do
  describe 'validations' do
    let(:user) { User.create(email: 'user@example.com', password: '0ksymoroN' )}
    let(:article) { Article.new(title: title, text: text, user: user) }

    let(:title) { 'Title' }
    let(:text) { 'Text' }

    subject { article.valid? }

    describe 'title' do
      context "when title doesn't exist" do
        let(:title) { nil }

        it 'is valid' do
          is_expected.to eq false
        end
      end

      context "when title is short" do
        let(:title) { 'home' }

        it "is invalid" do
          is_expected.to eq false
        end
      end

      context "when title is long" do
        let(:title) { 'Homer' }

        it "is valid" do
          is_expected.to eq true
        end
      end
    end
  end
end
