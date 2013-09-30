require 'spec_helper'

describe User do

  before(:each) do
    @attr = {
      :name => "Example User",
      :email => "user@example.com",
      :password => "changeme",
      :password_confirmation => "changeme"
    }

  end

  it { should respond_to(:courses)}
  it { should respond_to(:take_course!)}
  it { should respond_to(:taking_course?)}
  it { should respond_to(:remove_course!)}


  it "should create a new instance given a valid attribute" do
    User.create!(@attr)
  end

  it "should require an email address" do
    no_email_user = User.new(@attr.merge(:email => ""))
    no_email_user.should_not be_valid
  end

  it "should accept valid email addresses" do
    addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    addresses.each do |address|
      valid_email_user = User.new(@attr.merge(:email => address))
      valid_email_user.should be_valid
    end
  end

  it "should reject invalid email addresses" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    addresses.each do |address|
      invalid_email_user = User.new(@attr.merge(:email => address))
      invalid_email_user.should_not be_valid
    end
  end

  it "should reject duplicate email addresses" do
    User.create!(@attr)
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end

  it "should reject email addresses identical up to case" do
    upcased_email = @attr[:email].upcase
    User.create!(@attr.merge(:email => upcased_email))
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end

  describe "passwords" do

    before(:each) do
      @user = User.new(@attr)
    end

    it "should have a password attribute" do
      @user.should respond_to(:password)
    end

    it "should have a password confirmation attribute" do
      @user.should respond_to(:password_confirmation)
    end
  end

  describe "password validations" do

    it "should require a password" do
      User.new(@attr.merge(:password => "", :password_confirmation => "")).
        should_not be_valid
    end

    it "should require a matching password confirmation" do
      User.new(@attr.merge(:password_confirmation => "invalid")).
        should_not be_valid
    end

    it "should reject short passwords" do
      short = "a" * 5
      hash = @attr.merge(:password => short, :password_confirmation => short)
      User.new(hash).should_not be_valid
    end

  end

  describe "password encryption" do

    before(:each) do
      @user = User.create!(@attr)
    end

    it "should have an encrypted password attribute" do
      @user.should respond_to(:encrypted_password)
    end

    it "should set the encrypted password attribute" do
      @user.encrypted_password.should_not be_blank
    end

  end

  describe "accessible attributes" do
      it "should not allow access to admin" do
        expect do
          User.new(admin: "1")
        end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
      end
    end


  

  describe "taking course" do
    subject { @user }
    let(:course) {FactoryGirl.create(:course)}
    before do
      @user = User.new(@attr)
      @user.save
      @user.take_course!(course)
    end

    it { should be_taking_course(course)}
    its(:courses) { should include(course)}
    describe "and removing course" do
      before { @user.remove_course!(course)}

      it { should_not be_taking_course(course)}
    end
  end

  describe "attempting step" do
    subject { @user }
    let(:step) {FactoryGirl.create(:step)}
    before do
      @user = User.new(@attr)
      @user.save
      @user.attempt_step!(step)
    end

    it { should be_attempted_step(step)}
    describe "and removing course" do
      before { @user.remove_user_step!(step)}
      it { should_not be_attempted_step(step)}
    end
  end

 end