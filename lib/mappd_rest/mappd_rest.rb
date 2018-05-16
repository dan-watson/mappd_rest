module MappdRest
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def restify
      true
    end
  end
end
