require_relative "bottle/version"
require_relative "bottle/ioc"
require_relative "bottle/object"

module Bottle
	class ServiceNotFoundError < StandardError; end
	class MethodExistsError < StandardError; end
end
