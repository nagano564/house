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
      "Approval Letter" => false,
    }
  end

end
