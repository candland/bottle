require_relative 'ioc'
require_relative '../bottle'

class Object 
	def inject name
		::Bottle::Ioc.instance.inject_to self, name
	end
end
