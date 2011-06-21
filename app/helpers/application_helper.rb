module ApplicationHelper
  def dom_class(object, prefix = nil)
    return super(object, prefix) unless object.respond_to?(:purchased?)
    %(#{super(object, prefix)} #{object.purchased? ? 'purchased' : 'available'})
  end
end
