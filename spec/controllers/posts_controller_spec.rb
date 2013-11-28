require "spec_helper"

describe PostsController do
  before(:each) do
    @post = create(:post)
  end
  
  subject { @post }
  
  describe "GET show" do
    it "assignes new post as @post" do
      get :show, id: @post
      assigns(:post).should eq(@post)
    end
    
    it "renders the show template" do
      get :show, id: @post
      response.should render_template :show
    end
  end
  
  describe "GET index" do
    it "renders index template" do
      get :index
      response.should render_template :index
    end
  end
  
  describe "GET new" do
    it "assigns new post as @post" do
      get :new
      assigns(:post).should be_a_new(Post)
    end
  end
  
  describe "POST create" do
    describe "with valid params" do
      it "saves new post" do
        expect {
          post :create, post: attributes_for(:post)
        }.to change(Post, :count).by(1)
      end
      
      it "assigns new post as @post" do
        post :create, post: attributes_for(:post)
        assigns(:post).should be_a(Post)
        assigns(:post).should be_persisted
      end
      
      it "redirects to the post" do
        post :create, post: attributes_for(:post)
        response.should redirect_to(Post.last)
      end
    end
    
    describe "with invalid params" do
      it "assigns newly created but insaved post as @post" do
        Post.any_instance.stub(:save).and_return(false)
        post :create, post: attributes_for(:post)
        assigns(:post).should be_a_new(Post)
      end
      
      it "re-renders the new template" do
        Post.any_instance.stub(:save).and_return(false)
        post :create, post: attributes_for(:post)
        response.should render_template :new
      end
    end
  end
  
  describe "PUT update" do
    it "assignes the requested post as @post" do
      put :update, id: @post, post: attributes_for(:post)
      assigns(:post).should eq(@post)
    end
    
    describe "with invalid params" do
      it 'updates the requested question' do
        put :update, id: @post, post: attributes_for(:post, title: "New title!")
        @post.reload
        @post.title.should eq("New title!")
      end
      
      it "redirects to the post" do
        put :update, id: @post, post: attributes_for(:post, title: "New title!")
        @post.reload
        response.should redirect_to @post
      end
    end
    
    describe "with invalid params" do
      it "doesn't change @post attributes" do
        put :update, id: @post, post: attributes_for(:post, title: "")
        @post.reload
        @post.title.should_not eq("")
      end
      
      it "re-renders the 'edit' template" do
        put :update, id: @post, post: attributes_for(:post, title: "")
        response.should render_template :edit
      end
    end
  end
  
  describe "DELETE destroy" do
    it "destroys the requested question" do
      expect {
        delete :destroy, id: @post
      }.to change(Post, :count).by(-1)
    end
    
    it "redirects to the post list" do
      delete :destroy, id: @post
      response.should redirect_to posts_url
    end
  end
end