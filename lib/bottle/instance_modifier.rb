module Bottle
	class InstanceModifier
		attr_accessor :klass

		def initialize klass
			@klass = klass
		end

		def inject_or_assign_accessor name
			assert_no_method_conflict name

			iname = "@#{name}".to_sym

			klass.class_eval do
				define_method(name) do
					if instance_variable_defined? iname
					else
						instance_variable_set(iname, ::Bottle::Ioc.instance.resolve(name))
					end
					instance_variable_get(iname)
				end
			end
		end

		def assert_no_method_conflict name
			if klass.instance_methods.include?(name)
				raise Bottle::MethodExistsError.new(
					"Method '#{klass}##{name}' already exists, please alias inject :#{name}, alias: my_#{name}") 
			end
		end

	end
end
