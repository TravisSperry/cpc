class Box < ActiveRecord::Base
  belongs_to :powder

  validates  :powder, presence: true
  validate :original_weight_not_changed

  after_save :check_for_low_weight_reminder

  has_paper_trail

  def percent_left
    ((weight.to_f/original_weight.to_f)*100).to_i
  end

  private

    def original_weight_not_changed
      if original_weight_changed? && self.persisted?
        errors.add(:original_weight, "Can't change original weight after a box has been added.")
      end
    end

    def check_for_low_weight_reminder
      if send_low_powder_reminder?
        NotificationMailer.low_powder_notification(powder).deliver
        powder.update_attribute :last_weight_reminder, Date.today
      end
    end

    def send_low_powder_reminder?
      (powder.total_weight <= powder.reminder_weight) && (powder.last_weight_reminder.nil? || powder.last_weight_reminder < Date.today - 4.days)
    end
end
