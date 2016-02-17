class OdpscmdPublic < FPM::Cookery::Recipe
  name     'odpscmd'
  version  '0.20.2'
  revision '4'
  arch     'noarch'

  homepage    'http://github.com/aliyun/aliyun-odps-console'
  source      'https://docs-aliyun.cn-hangzhou.oss.aliyun-inc.com/cn/odps/0.0.84/assets/download/odpscmd_public.zip'
  md5         '351009e7d2a327251ee93b8318aca482'
  description 'Aliyun ODPS Command Line Tool'
  section     'database'
  license     'Apache License 2.0'
  maintainer  'Li Ruibo <lymanrb@gmail.com>'

  fpm_attributes :rpm_os => 'linux'

  case FPM::Cookery::Facts.target
  when :deb
  then
    depends  'default-jre-headless'
  when :rpm
  then
    depends 'java >= 1.6'
  end

  def build
  end

  def install
    bin.install workdir('odpscmd')

    opt('odpscmd').mkdir
    opt('odpscmd').install 'conf'
    opt('odpscmd').install 'lib'
    opt('odpscmd').install 'plugins'
  end
end
