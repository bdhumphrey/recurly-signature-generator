class App < Sinatra::Base

  use Rack::JSONP

  SUBDOMAIN   = 'recurlyjsdemo-test'
  PRIVATE_KEY = '0123456789ABCDEF0123456789ABCDEF'

  get '/:plan/signature' do
    content_type :json
    Recurly.subdomain      = SUBDOMAIN
    Recurly.js.private_key = PRIVATE_KEY

    signature = Recurly.js.sign subscription: { plan_code: params[:plan] }
    { signature: signature }.to_json
  end
end
