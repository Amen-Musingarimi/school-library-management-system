require_relative 'decorator'

class TrimmerDecorator < Decorator
  MAX_LENGTH = 10

  def correct_name
    super[0...MAX_LENGTH]
  end
end
