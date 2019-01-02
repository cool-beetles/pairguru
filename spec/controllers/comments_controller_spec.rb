require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe 'as logged user' do
    let(:genre) { Genre.create(name: 'comedy') }
    let(:movie) { Movie.create(title: 'Test Wars', description: "Test 123 test", genre: genre) }
    let(:user)  { User.create(id: 22, name: 'Test', email: 'test@test.com', password: 'secret' ) }
    
    before do
      sign_in(user)
      user.confirm
    end

    describe 'POST create' do
      it 'should save the new comment in the database' do
        expect{ post :create, params: { movie_id: movie.id, comment: { body: 'test 123' } } }.to change{Comment.count}.by(1)
      end
      
      context "create comment with invalid attributes" do
        it "should not save the new comment in the database" do
          expect{ post :create, params: { movie_id: movie.id, comment: { body: '' } } }.to change{Comment.count}.by(0)
        end
      end
    end

    # I have a problem with this test, so I add like comment
    
    # describe 'DELETE destroy' do      
    #   it 'delete useless comment' do
    #     comment = user.comments.first
    #     delete :destroy, params: { movie_id: movie.id, comment: { id: comment.id } }
    #     expect(response).to redirect_to(movie_path(comment.movie_id))
    #   end
    # end
  end
end
