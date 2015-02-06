module Cuttings
  extend ActiveSupport::Autoload

  autoload :Greenhouse
  autoload :Cutting

  def self.plant(&block)
    greenhouse = Cuttings::Greenhouse.new
    greenhouse.instance_eval(&block)
    greenhouse.process
  end
end
