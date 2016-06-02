class Cars < Grape::API

  version 'v1', using: :header, vendor: 'creepycake'
  format :json

  resource 'cars' do

    desc 'Show ETA'
    params do
      requires :lat, type: Float
      requires :lon, type: Float
    end
      get '/closest' do
        {
          eta_in_minutes: "#{Car.get_eta({ latitude: params[:lat], longitude: params[:lon] }).to_i} minutes",
          info: 'ETA'
        }
      end

    rescue_from :all do |e|
      raise e
      error_response(message: "Server error #{e}", status: 500)
    end

  end

  add_swagger_documentation  :info => { :title => 'Cars API' },
                             :hide_documentation_path => true,
                             :mount_path => '/swagger_doc.json',
                             :markdown => false,
                             :api_version => 'v1'

  before do
    header['Access-Control-Allow-Origin'] = '*'
    header['Access-Control-Request-Method'] = '*'
  end

end