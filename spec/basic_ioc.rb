require_relative 'spec_helper'


describe Bottle, "basic IOC" do
	Bottle::Ioc.configure do |c|
		c.register :basic_ioc do
			"my service x"
		end
	end

	class B
		inject :basic_ioc
	end

	let (:b) {
		B.new
	}

	describe "inject method into class" do
		it "must respond to the inject method" do
			b.must_respond_to :basic_ioc
		end

		it "must return my service x" do
			b.basic_ioc.must_equal "my service x"
		end
	end
end
