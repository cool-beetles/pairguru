require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user)    { User.new(name: "Test123", email: "test@test.com") }
  let(:movie)   { Movie.new(title: "Test Wars", description: "Test 54321") }

 describe "validations" do
    context "when text is provided" do
      it "is valid" do
        comment = Comment.new(user: user, movie: movie, body: "test")
        expect(comment.valid?).to eq(true)
      end
    end
        
    context "when text isn't provided" do
      it "is invalid" do
        comment = Comment.new(user: user, movie: movie)
        expect(comment.invalid?).to eq(true)
      end
    end
  end
end
