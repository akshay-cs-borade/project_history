class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :comments
  has_many :histories
  has_many :assigned_projects, class_name: "Project", foreign_key: "manager_id"
  has_many :developer_projects, class_name: "Project", foreign_key: "developer_id"

  enum role: { developer: 0, manager: 1, admin: 2 }
  
  def can_change_status?
    manager? || admin?
  end

  def can_delete_comments?
    admin?
  end

  def can_assign_project?
    admin? || manager?
  end
end
