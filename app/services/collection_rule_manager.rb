module CollectionRuleManager

  attr_reader :rules

  def add_rule(name, &block)
    @rules ||= []
    @rules << block
  end

end