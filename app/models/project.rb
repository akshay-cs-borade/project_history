class Project < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_many :histories, dependent: :destroy
    belongs_to :manager, class_name: "User", optional: true
    belongs_to :developer, class_name: "User", optional: true

    STATUSES = ["Pending", "In Progress", "Completed"].freeze

    def change_status(new_status, user)
        return false unless STATUSES.include?(new_status) && user.can_change_status?

        histories.create!(previous_status: status, new_status: new_status, user: user)
        update!(status: new_status)
    end  
end
