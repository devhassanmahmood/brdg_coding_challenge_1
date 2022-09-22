namespace :import_copy_base do
  desc 'Import copy base from Airtable'
  task copy_data: :environment do
    Airtable.call
  end
end
