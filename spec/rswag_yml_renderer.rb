# frozen_string_literal: true

class RswagYMLRenderer
  attr_reader :template_path

  # @param template_path [String]
  def initialize(template_path)
    @template_path = template_path
  end

  def render
    ERB.new(File.read(template_path, encoding: 'utf-8')).result(binding)
  end
end
