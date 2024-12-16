class ApplicationSerializer < ActiveModel::Serializer
  # Se voglio definire un comportamento comune tra tutti i miei serializer.
  def included?(attr)
    instance_options[:included].split(',').
      any? do |res|
      parent = attr.split('.')
      (res == '*') ||
        (res == attr) ||
        (res.match?(%r{^#{attr}\..*})) ||
        (res.match?(%r{.*#{parent.first}\.\*\*?}))
    end
  end
end