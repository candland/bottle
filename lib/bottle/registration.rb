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

		def inject_to klass, name, options = {}
			if not injected_to?(klass)
				InstanceModifier.new(klass).inject_or_assign_accessor(name)
				injected_to(klass)
			end
		end

		private 
		
		def injected
			@injected_to ||= []
		end

	end
end
