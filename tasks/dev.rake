task :install_libraries do
  system 'bundle install'
  system 'npm i'
end
