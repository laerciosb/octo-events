# frozen_string_literal: true

class VersionConstraint
  def initialize(options)
    @version = options[:version]
    @default = options[:default]
  end

  def matches?(req)
    @default || req.headers['Accept'].include?("version=#{@version}")
  end
end
