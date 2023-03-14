# frozen_string_literal: true

class ShiftsStatusComponent < ViewComponent::Base
  def initialize(shifts:)
    @shifts = shifts
  end

end
