source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.3"

gem "rails", "~> 6.0.4", ">= 6.0.4.7"
gem "pg", ">= 0.18", "< 2.0"
gem "puma", "~> 4.1"
gem "bootsnap", ">= 1.4.2", require: false
gem "figaro"
gem "bcrypt"
gem "rack-cors"
gem "jwt"
gem "active_model_serializers", "~> 0.10.10"
gem "kaminari"
gem "faker"
gem "aws-sdk-s3"
gem "google-api-client"
gem "google_drive"
gem "rails-erd"
gem "faker"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem "listen", "~> 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
