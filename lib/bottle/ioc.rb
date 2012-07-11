require 'singleton'
require_relative 'registration'
require_relative 'registry'
require_relative 'instance_modifier'

module Bottle
	class Ioc
		include Singleton

		def self.configure &block
			Ioc.instance.tap &block
		end

		def registry
			@registry ||= Registry.new
		end

		def register name, &block
			if registry[name]
				registry[name].block = block
			else
				registry[name.to_sym] = Registration.new(name, block)
			end
			self
		end

		def resolve name
			registry.resolve(name)
		end

		def inject_to klass, as, options = {}
			name = as.to_sym
			registration = (registry[name] ||= Registration.new(name))
			registration.inject_to(klass, name, options)
		end

	end

end
