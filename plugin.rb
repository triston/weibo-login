# name: Weibo login
# about: Authenticate with discourse with weibo.
# version: 0.1.0
# author: Erick Guan

gem 'omniauth-weibo-oauth2', '0.3.0'

class WeiboAuthenticator < ::Auth::Authenticator

  def name
    'weibo'
  end

  def after_authenticate(auth_token)
    result = Auth::Result.new

    data = auth_token[:info]
    credentials = auth_token[:credentials]
    email = auth_token[:extra][:email]
    raw_info = auth_token[:extra][:raw_info]
    name = data['name']
    username = data['nickname']
    weibo_uid = auth_token[:uid]

    current_info = ::PluginStore.get('weibo', "weibo_uid_#{weibo_uid}")

    result.user =
      if current_info
        User.where(id: current_info[:user_id]).first
      end

    result.name = name
    result.username = username
    result.email = email
    result.extra_data = { weibo_uid: weibo_uid, raw_info: raw_info }

    result
  end

  def after_create_account(user, auth)
    weibo_uid = auth[:uid]
    ::PluginStore.set('weibo', "weibo_id_#{weibo_uid}", {user_id: user.id})
  end

  def register_middleware(omniauth)
    omniauth.provider :weibo, :setup => lambda { |env|
      strategy = env['omniauth.strategy']
      strategy.options[:client_id] = SiteSetting.weibo_client_id
      strategy.options[:client_secret] = SiteSetting.weibo_client_secret
    }
  end
end

auth_provider :frame_width => 920,
              :frame_height => 800,
              :authenticator => WeiboAuthenticator.new,
              :background_color => 'rgb(230, 22, 45)'

register_css <<CSS

.btn-social.weibo:before {
  font-family: FontAwesome;
  content: "\\f18a";
}

CSS
