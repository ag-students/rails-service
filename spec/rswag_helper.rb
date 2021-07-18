# frozen_string_literal: true

require 'rswag_yml_renderer'

module RswagHelper
  module RefHelper
    def rswag_ref(*keys)
      "#/components/schemas/#{definition_name(keys)}"
    end

    private

    def definition_name(arr)
      arr.map(&:to_s).map(&:camelize).join('::')
    end
  end

  class RswagDefinitionFile
    SPLIT_BORDER_FOLDER = 'definitions'

    def initialize(filepath)
      @filepath = filepath
      @filepath_splitted = filepath.chomp('.yml').split('/')
    end

    def name
      split_border_idx = filepath_splitted.index { |x| x == SPLIT_BORDER_FOLDER }
      RswagHelper.definition_name(
        filepath_splitted[(split_border_idx + 1)..]
      )
    end

    def to_yml
      YAML.safe_load(::RswagYMLRenderer.new(filepath).render, [Symbol])
    end

    private

    attr_reader :filepath, :filepath_splitted
  end

  def self.definition_name(arr)
    arr.map(&:to_s).map(&:camelize).join('::')
  end

  # @note subfolders of `definitions` folder will be displayed as namespaces
  # @param path [String] path to the definitions folder
  def self.parse_definitions(path)
    result = Dir.glob(Rails.root.join(path, '**', '*.yml')).map do |filepath|
      definition = RswagDefinitionFile.new(filepath)

      [definition.name, definition.to_yml]
    end

    result.to_h.compact.presence
  end

  def rswag_ref(*keys)
    "#/components/schemas/#{RswagHelper.definition_name(keys)}"
  end
end
