module Bottle
	class Registry < Hash

		def resolve name
			if self[name.to_sym] and self[name.to_sym].block
				return self[name.to_sym].block.call
			else
				raise RegistrationNotFoundError.new("Registration #{name} not found.")
			end
		end

	end
end
