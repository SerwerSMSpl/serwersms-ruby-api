module SerwerSMS
  class Error < StandardError
    attr_reader :code

    def initialize(message = nil, code = 0)
      super(message)
      @code = code.to_i
    end
  end
end
