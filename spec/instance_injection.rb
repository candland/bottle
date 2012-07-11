require_relative 'spec_helper'

describe Bottle, "instance injection" do
	Bottle::Ioc.configure do |c|
		c.register :instance_injection do
			Hash.new
		end
	end

	class X
		inject :instance_injection
	end

	let(:x) {X.new}

	describe "inject method into instance variable in class" do
		it "must respond to instance_injection" do
			x.must_respond_to :instance_injection
		end

		it "wont be same as class instance" do
			x.instance_injection.wont_be_same_as X.new.instance_injection
		end

		it "wont respond to instance_injection on class" do
			X.wont_respond_to :instance_injection
		end
	end
end
