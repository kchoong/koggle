# frozen_string_literal: true

class ClockComponent < ViewComponent::Base
  def initialize(datetime:)
    @time = datetime.to_time
    @date = datetime.to_date
  end

end
