module Bottle
	class Registration
		attr_accessor :name, :block
		
		def initialize name, block = nil, options = {}
			@name = name
			@options = options
			@block = block
		end

		def injected_to klass
			injected << klass
		end

		def injected_to? klass
			injected.include?(klass)
		end

		private 
		
		def injected
			@injected_to ||= []
		end

	end
end
