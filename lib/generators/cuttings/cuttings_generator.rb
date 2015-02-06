require 'fileutils'

class CuttingsGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  desc 'Cuttings install generator'

  def welcome
    say 'Creating new cuttings ...'
  end

  def create_folders
    template 'cuttings.rake', "lib/seeds/tasks/#{ name }.rake"
  end

  private

  def base_dir
    @base_dir ||= Rails.root.join('lib', 'seeds')
  end
end
