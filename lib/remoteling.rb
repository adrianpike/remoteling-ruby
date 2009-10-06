require 'yaml'
require 'uri'
require 'net/http'
require 'cgi'
require 'ruby2ruby'

class Remoteling
	class OurBad < Exception; end
	class Unauthorized < Exception; end
	class Timeout < Exception; end
	
	CONFIG = {
		:timeout => 2,
#		:remoteling_host => 'http://remoteling.com/'
		:remoteling_host => 'http://localhost:3000/'
	}
	
	def initialize(login,password)
		@login = login
		@password = password
	end
	
	def set(key,value)
		call_action('store', :put, key, serialize(value))
	end
	
	def get(key)
	  deserialize(call_action('store', :get, key))
	end
	
	def push(queue_name, item)
		call_action('queue', :put, queue_name, serialize(item))
	end
	
	def pop(queue_name)
		deserialize(call_action('queue', :get, queue_name))
	end

	def run_serialized(code, vars)
		call_action('process',:post,'',{'process[language]' => 'Ruby', 'process[code]' => code, 'process[variables]' => vars})
	end

	def run(proc_name, args)
		call_action('process',:put, proc_name, args)
	end
	
	private
	
	# Action can be 'queue', 'store', or 'process'
	# Method can be :get, :post, or :put
	def call_action(action,method,item='',data=nil)
		url = URI.parse(CONFIG[:remoteling_host]+action+'/'+item)
		case method
		when :get
			req = Net::HTTP::Get.new(url.path)
		when :post
			req = Net::HTTP::Post.new(url.path)
		when :put
			req = Net::HTTP::Put.new(url.path)
		end
		
		req.basic_auth @login, @password
		res = Net::HTTP.new(url.host, url.port).start {|http|
			if data.is_a?(Hash) then
				req.set_form_data(data)
				data = nil
			end
			data ? http.request(req,data) : http.request(req)
		}
	  case res
		when Net::HTTPSuccess
			res.body
		when Net::HTTPMethodNotAllowed
			raise OurBad
		when Net::HTTPUnauthorized
			raise Unauthorized
		end
	end
	
	def deserialize(data)
		YAML.load(data)
	end
	
	def serialize(data)
		data.to_yaml
	end
	
end