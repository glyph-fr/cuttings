require 'fileutils'

module Cuttings
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    desc 'Cuttings install generator'

    def welcome
      say 'Installing cuttings ...'
    end

    def create_folders
      FileUtils.mkdir_p(base_dir.join('attachments'))
      FileUtils.mkdir_p(base_dir.join('tasks'))
    end

    private

    def base_dir
      @base_dir ||= Rails.root.join('lib', 'seeds')
    end
  end
end
