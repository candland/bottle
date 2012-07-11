require_relative 'spec_helper'


describe Bottle, "basic IOC" do
	Bottle::Ioc.configure do |c|
		c.register :basic_ioc do
			"my service x"
		end
		c.register(:logger) {Logger.new STDOUT}
	end

	class B
		inject :basic_ioc
		inject :logger
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

	describe "inject new class into accessor" do
	end

	describe "register_directory" do
		it "must look for classes in a directory" do
		end

		it "must use class in environment module" do
			# /                    <- production components
			# 	/test              <- test components or anything matching environment.
			# 		-component_x
			# 	-compenent_x
			#
			# Given test environment use Test::ComponentX assume production.
		end
	end

	describe "register_module" do
		it "must register classes under the given module" do
		end

		it "must handle namespacing by using the first registered class found" do
		end
	end

end
