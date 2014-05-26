class GenerateEngine

  attr_reader :request



  def initialize (request)
    raise ArgumentError if request.nil?

    @request = request

  end

  def run

    @success = true
  end

  def success?
    @success
  end

end