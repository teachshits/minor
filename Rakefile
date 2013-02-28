#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Minority::Application.load_tasks
namespace :spec do
desc "Add files that DHH doesn't consider to be 'code' to stats"
task :statsetup do
require 'rails/code_statistics'
 
class CodeStatistics
alias calculate_statistics_orig calculate_statistics
def calculate_statistics
@pairs.inject({}) do |stats, pair|
if 3 == pair.size
stats[pair.first] = calculate_directory_statistics(pair[1], pair[2]); stats
else
stats[pair.first] = calculate_directory_statistics(pair.last); stats
end
end
end
end
::STATS_DIRECTORIES << ['Views', 'app/views', /\.(rhtml|erb|rb)$/]
# note, I renamed all my rails-generated email fixtures to add .txt
::STATS_DIRECTORIES << ['HTML', 'public', /\.html$/]
::STATS_DIRECTORIES << ['SAAS', 'app/assets/stylesheets', /\.css.scss$/]
::STATS_DIRECTORIES << ['JS', 'app/assets/javascripts', /\.js$/]
# prototype is ~5384 LOC all by itself - very hard to filter out
 
::CodeStatistics::TEST_TYPES << "Email Fixtures"
end
end
task :stats => "spec:statsetup"
