describe Api::V1::AuthenticationsController, :type => :routing do

  it 'Post sign_up' do
    expect(post: 'api/v1/sign_up').to route_to(controller: 'api/v1/authentications', action: 'sign_up')
  end

  it 'Post sign_in' do
    expect(post: 'api/v1/sign_in').to route_to(controller: 'api/v1/authentications', action: 'sign_in')
  end
end
