class Box < ActiveRecord::Base
  belongs_to :powder

  validate :original_weight_not_changed

  def percent_left
    ((weight.to_f/original_weight.to_f)*100).to_i
  end

  private

    def original_weight_not_changed
      if original_weight_changed? && self.persisted?
        errors.add(:original_weight, "Can't change original weight after box has been added.")
      end
    end
end
