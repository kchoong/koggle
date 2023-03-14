# frozen_string_literal: true

class PinComponent < ViewComponent::Base
  def initialize(worker:)
    @worker = worker
  end

end
