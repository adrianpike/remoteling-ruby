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
		
		should 'pop nulls off an empty queue' do
		end
		
		should 'be able to execute a stored process' do
		end
		
		should 'be able to execute a serialized process' do
		end
		
		should 'be able to pass variables to a process' do
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