Pod::Spec.new do |s|
  s.name             = 'SigningIdentity'
  s.version          = '1.0.0'
  s.summary          = 'iOS Signing Identity Configuration for Astro Flux'
  s.homepage         = 'https://github.com/astro-flux/astro-flux'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Astro Flux Team' => 'team@astroflux.dev' }
  s.source           = { :path => '.' }
  s.platform         = :ios, '12.0'
  s.swift_version    = '5.0'

  s.resource_bundles = {
    'SigningIdentity' => ['Assets/*.xcassets']
  }

  s.pod_target_xcconfig = {
    'CODE_SIGN_STYLE' => 'Automatic',
    'CODE_SIGNING_REQUIRED' => 'YES',
    'CODE_SIGNING_ALLOWED' => 'YES'
  }

  s.user_target_xcconfig = {
    'CODE_SIGN_STYLE' => 'Automatic',
    'CODE_SIGNING_REQUIRED' => 'YES',
    'CODE_SIGNING_ALLOWED' => 'YES'
  }
end
