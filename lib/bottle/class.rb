require_relative 'ioc'
require_relative '../bottle'

class Class 
	def inject name
		::Bottle::Ioc.instance.inject_to self, name
	end
end
