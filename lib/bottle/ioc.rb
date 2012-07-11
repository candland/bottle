require 'singleton'

module Bottle
	class Ioc

		include Singleton

		def services
			@services ||= {}
		end

		def self.configure &block
			Ioc.instance.tap &block
		end

		def register name, &block
			if services[name]
				services[name][:block] = block
			else
				services[name.to_sym] = {
					block: block,
					injected_to: []
				}
			end
			self
		end

		def resolve name
			if services[name.to_sym] and services[name.to_sym][:block]
				puts "RESOLVED #{name} to #{services[name.to_sym][:block]}"
				return services[name.to_sym][:block].call
			else
				raise ServiceNotFoundError.new("Service #{name} not found.")
			end
		end

		def inject_to klass, as, options = {}
			name = as.to_sym
			iname = "@#{name}".to_sym
			service = (services[name] ||= {block: nil, injected_to: []})

			if not already_injected service, klass
				assert_no_name_conflict klass, name

				klass.class_eval do
					define_method(name) do
						if instance_variable_defined? iname
						else
							instance_variable_set(iname, ::Bottle::Ioc.instance.resolve(name))
						end
						instance_variable_get(iname)
					end
				end

				service[:injected_to] << klass
			end
		end

		private

		def already_injected service, klass
			service[:injected_to].include?(klass)
		end

		def assert_no_name_conflict klass, name
			if klass.instance_methods.include?(name)
				raise Bottle::MethodExistsError.new(
					"Method '#{klass}##{name}' already exists, please alias inject :#{name}, alias: my_#{name}") 
			end
		end
	end

end