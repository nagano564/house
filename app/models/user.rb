class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  serialize :checklist, Hash

  before_create :setup_checklist

  def self.find_for_oauth(auth)
    find_or_create_by(uid: auth.uid, provider: auth.provider)
  end

  private

  def setup_checklist
    self.checklist = {
      "Organize Your Finances" => false,
      "Do Calculations" => false,
      "Approval Letter" => false,
      "Find an Agent" => false,
      "Find a lawyer and make an offer" => false,
      "Get the mortgage" => false,
      "Appraisal and Home insepection" => false,
      "Close the deal" => false
    }
  end
end
