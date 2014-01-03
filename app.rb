class App < Sinatra::Base

  use Rack::JSONP

  get '/:plan/signature' do
    content_type :json
    Recurly.subdomain      = 'recurlyjsdemo-test'
    Recurly.js.private_key = '0123456789ABCDEF0123456789ABCDEF'

    signature = Recurly.js.sign subscription: { plan_code: params[:plan] }
    { signature: signature }.to_json
  end
end
