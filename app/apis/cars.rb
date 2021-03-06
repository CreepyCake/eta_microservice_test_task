#we just want to get ETA from server
class Cars < Grape::API

  version 'v1', using: :header, vendor: 'creepycake'
  format :json

  resource 'cars' do

    desc 'Show ETA'
    #user position is defined by parameters in 'get' request
    params do
      requires :lat, type: Float #user latitude
      requires :lon, type: Float #user longitude
    end
    get '/closest' do
      {
        eta_in_minutes: "#{Car.get_eta({ latitude: params[:lat], longitude: params[:lon] }).to_i} minutes",
        info: 'ETA'
      }
    end

  end

  #swagger documentation in json format
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