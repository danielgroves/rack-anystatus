module Rack
    module Anystatus
        class Endpoint
            F = ::File
            def initialize(status_code, path)
                file = F.expand_path path
                @content = F.read file
                @length = @content.length.to_s
                @status_code = status_code
            end

            def call(env)
                [@status_code, {'Content-Type' => 'text/html', 'Content-Length' => @length}, [@content]]
            end
        end
    end
end
