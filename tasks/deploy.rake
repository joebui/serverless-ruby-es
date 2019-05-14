task :deploy do
  if system 'bundle install --deployment --without test development'
    system 'sls deploy'
    system 'rm -rf vendor .bundle'
  end
end

# Used for updating deployed function's code
task :update_function, :name do |_task, args|
  system "sls deploy function -f #{args[:name]}"
end
