require 'spec_helper'
require 'omniauth-allscripts'

describe OmniAuth::Strategies::AllScripts do
  subject { OmniAuth::Strategies::AllScripts.new(nil) }

  it 'adds camelization for itself' do
    expect(OmniAuth::Utils.camelize('allscripts')).to eq('AllScripts')
  end

  describe '#client' do
    it 'has correct AllScripts site' do
      expect(subject.client.site).to eq('https://pro171.open.allscripts.com')
    end

    it 'has correct `authorize_url`' do
      expect(subject.client.options[:authorize_url]).to eq('https://pro171.open.allscripts.com/authorization/connect/authorize')
    end

    it 'has correct `token_url`' do
      expect(subject.client.options[:token_url]).to eq('https://pro171.open.allscripts.com/authorization/connect/token')
    end
  end

  describe '#callback_path' do
    it 'has the correct callback path' do
      expect(subject.callback_path).to eq('/auth/allscripts/callback')
    end
  end

  describe '#uid' do
    it 'returns SecureRandom.hex(8) for the uid' do
      expect(subject.uid).to match(/\w{16}/)
    end
  end

  describe '#access_token' do
    let(:expires_in) { 3600 }
    let(:expires_at) { 946688400 }
    let(:token) { 'token' }
    let(:access_token) do
      instance_double OAuth2::AccessToken, :expires_in => expires_in,
        :expires_at => expires_at, :token => token
    end

    before :each do
      allow(subject).to receive(:oauth2_access_token).and_return access_token
    end

    specify { expect(subject.access_token.expires_in).to eq expires_in }
    specify { expect(subject.access_token.expires_at).to eq expires_at }
  end

  describe '#authorize_params' do
    describe 'scope' do
      before :each do
        allow(subject).to receive(:session).and_return({})
      end

      it 'sets default scope' do
        expect(subject.authorize_params['scope']).to eq('launch openid')
      end
    end
  end
end
