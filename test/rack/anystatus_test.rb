require 'test_helper'

describe "Rack::AnystatusTest" do
  specify "the module ahs a version number" do
    refute_nil ::Rack::Anystatus::VERSION
  end

  specify "the correct file contents is returned with a status code" do
    app = Rack::Builder.new do
      map '/test' do
        use Rack::Lint
        run Rack::Anystatus::Endpoint.new(200, 'test/assets/200.html')
      end
    end
    
    response = Rack::MockRequest.new(app).get('/test')

    response.body.must_equal('Found')
    response.status.must_equal(200)
  end

  specify "the correct file contents is returned with a status code" do
    app = Rack::Builder.new do
      map '/test2' do
        use Rack::Lint
        run Rack::Anystatus::Endpoint.new(201, 'test/assets/201.html')
      end
    end
    
    response = Rack::MockRequest.new(app).get('/test2')

    response.body.must_equal('Created')
    response.status.must_equal(201)
  end

  specify "it blows up if the file does not exist" do
    app = Rack::Builder.new do
      map '/' do
        use Rack::Lint
        run Rack::Anystatus::Endpoint.new(200, 'test/assets/doesnotexist.html')
      end
    end
    
    err = ->{ Rack::MockRequest.new(app).get('/') }.must_raise Errno::ENOENT
    err.message.must_match /No such file or directory/
  end
end
