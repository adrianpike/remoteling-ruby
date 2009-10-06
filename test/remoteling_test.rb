require 'rubygems'
require 'shoulda'
require 'lib/remoteling'

class RemotelingTest < Test::Unit::TestCase

	context 'a simple remoteling client' do
		setup do
			@r = Remoteling.new('adrian@pikeapps.com','testing')
		end

		should 'be able to set and get something' do
			@r.set('foobar','testing')
			val = @r.get('foobar')
			assert_equal 'testing', val
		end
		
		should 'be able to push and pop something' do
			@r.push('foobar','lolwat')
			val = @r.pop('foobar')
			assert_equal 'lolwat', val
		end
		
		should 'pop falses off an empty queue' do
			vals = []
			2.times do
				vals << @r.pop('foobar')
			end
			assert_equal false, vals.last
		end
		
		should 'be able to execute a stored process' do
			# We'll have to set up a stored process to be able to execute it.
		end
		
		should 'be able to execute a serialized process' do
			@r.set('foobar_test_results',nil)
			code = <<EOM
			Remoteling.store('foobar_test_results','yarr')
EOM
			@r.run_serialized(code, 'foobar')
			sleep 2
			assert_equal 'yarr', @r.get('foobar_test_results')
		end
		
		should 'be able to pass variables to a serialized process' do
			var = ''
			5.times { var << rand(93) + 33 }
			code = <<EOM
			Remoteling.store('foobar_results',Remoteling.variables)
EOM
			@r.run_serialized(code, var)
			sleep 2
			assert_equal var, @r.get('foobar_results')
		end
	end
	
	context 'a remoteling client with bad login/password information' do
		setup do
			@r = Remoteling.new('foo','bar')
		end

		should 'not be able to set' do
			assert_raise Remoteling::Unauthorized do
				@r.set('foo','bar')
			end
		end

		should 'not be able to get' do
				assert_raise Remoteling::Unauthorized do
					@r.get('foo')
				end
		end
	end
	
end