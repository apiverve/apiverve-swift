Pod::Spec.new do |s|
  s.name             = 'APIVerveCore'
  s.version          = '1.2.3'
  s.summary          = 'Shared response, error and request types for the APIVerve iOS/macOS SDKs.'
  s.description      = <<-'DESC'
APIResponse, APIVerveValue, APIVerveError and the request plumbing used by every APIVerve pod.
Each API pod depends on this one and re-exports it, so an app can use several APIs without
ambiguous type names. You do not need to add it to your Podfile yourself.
                       DESC

  s.homepage         = 'https://apiverve.com'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'APIVerve' => 'hello@apiverve.com' }
  # Lives in the Swift package repo; the pod version is the package's semver tag.
  s.source           = { :git => 'https://github.com/apiverve/apiverve-swift.git', :tag => s.version.to_s }

  s.ios.deployment_target = '15.0'
  s.osx.deployment_target = '12.0'

  s.swift_version = '5.0'

  s.source_files = 'Sources/APIVerveCore/**/*.swift'

  s.frameworks = 'Foundation'
end
