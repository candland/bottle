require_relative "bottle/version"
require_relative "bottle/ioc"
require_relative "bottle/class"

module Bottle
	class RegistrationNotFoundError < StandardError; end
	class MethodExistsError < StandardError; end
end
