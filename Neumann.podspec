Pod::Spec.new do |s|
  s.name = 'Neumann'
  s.version = '1.1.1'
  s.license = 'MIT'
  s.summary = 'Neumann is a framework that expose reusable components.'
  s.description  = <<-DESC
    As we always use the same or a really close object, we made severals components that we want to share with you.
                   DESC
  s.homepage = 'https://github.com/MoveUpwards/Neumann.git'
  s.authors = { 'Damien NOËL DUBUISSON' => 'damien@slide-r.com', 'Loïc GRIFFIÉ' => 'loic@slide-r.com' }
  s.source = { :git => 'https://github.com/MoveUpwards/Neumann.git', :tag => s.version }
  s.swift_version   = '5.0'

  s.ios.deployment_target = '10.0'

  s.source_files = 'Neumann/Sources/**/*.swift'

  s.frameworks = 'Foundation'
end
