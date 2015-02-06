namespace :seed do
  task <%= name %>: :environment do
    Cuttings.plant do
      # Add your seeding code here
    end
  end
end
