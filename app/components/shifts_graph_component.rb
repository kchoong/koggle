# frozen_string_literal: true

class ShiftsGraphComponent < ViewComponent::Base
  def initialize(shifts:)
    @shifts = shifts
  end

end
