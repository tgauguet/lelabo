task :rails_best_practices do
	path = File.expand_path("../../../", __FILE__)
	sh "rails_best_practices #{path}"
end

task :brakeman do
	sh "brakeman -q -z"
end

task :deploy do
	sh "git push heroku master"
end