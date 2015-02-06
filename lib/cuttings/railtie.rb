module Cuttings
  class Railtie < Rails::Railtie
    rake_tasks do
      tasks_path = Rails.root.join('lib', 'seeds', 'tasks', '**', '*.rake')

      Dir[tasks_path].each do |file|
        load file
      end
    end
  end
end
