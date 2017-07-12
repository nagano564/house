class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  serialize :checklist, Hash

  before_create :setup_checklist

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
