class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  serialize :checklist, Hash

  before_create :setup_checklist

  def self.from_omniauth(auth)
    where(auth.slice[:provider, :uid]).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.username = auth.info.nickname
    end
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
