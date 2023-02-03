# https://launchschool.com/exercises/56a87411

class Device
  def initialize
    @recordings = []
  end

  def record(recording)
    @recordings << recording
  end

	def listen
		record(yield) if block_given?
	end

	def play
		@recordings.each do |r|
			puts r
		end
	end
end

listener = Device.new
listener.listen { "Hello World!" }
listener.listen
listener.play # Outputs "Hello World!"