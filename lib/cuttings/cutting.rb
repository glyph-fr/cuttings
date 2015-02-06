module Cuttings
  class Cutting
    attr_accessor :model_name, :processor

    def initialize(model_name, options = {}, &block)
      self.model_name = model_name
      self.processor = block
    end

    def model
      @model ||= model_name.constantize
    end

    def run
      processor && instance_eval(&processor)
      close_all_open_files
    end

    def create(attrs)
      model.create!(attrs)
    end

    def attachment(path)
      file = File.open(Rails.root.join('lib', 'seeds', 'attachments', path))
      attachment_files << file
      file
    end

    private

    def attachment_files
      @attachment_files ||= []
    end

    def close_all_open_files
      attachment_files.each(&:close)
      attachment_files.clear
    end
  end
end
