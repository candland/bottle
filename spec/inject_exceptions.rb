require_relative 'spec_helper'

describe Bottle, "injection exceptions" do
	class Y
		inject :inject_errors

		def me
		end
	end

	let(:y) {Y.new}

	describe "service not found" do
		it "must throw when not found on use" do
			-> {
				y.inject_errors
			}.must_raise Bottle::ServiceNotFoundError
		end
	end

	describe "method exists" do
		it "must raise method exists exception" do
			-> {
				class Y
					inject :me
				end
			}.must_raise Bottle::MethodExistsError
		end
	end
end
