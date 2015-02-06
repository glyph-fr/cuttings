module Cuttings
  class Greenhouse
    def seed(model_name, options = {}, &block)
      truncatable_models << model_name unless options.delete(:truncate) == false
      creatable_models << Cutting.new(model_name, options, &block)
    end

    def truncate(*model_names)
      truncatable_models.concat(model_names.flatten)
    end

    def truncatable_models
      @truncatable_models ||= []
    end

    def creatable_models
      @creatable_models ||= []
    end

    def process
      truncate_models
      creatable_models.each(&:run)
    end

    def truncate_models
      truncatable_models.each do |model_name|
        model_name.constantize.destroy_all
      end
    end
  end
end
