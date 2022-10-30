# frozen_string_literal: true

module FactoryBot::Syntax::Methods
  def attributes_with_foreign_keys_for(*args)
    build(*args)
      .attributes
      .delete_if { |key, _| %w[id created_at updated_at].member?(key) }
      .compact
  end
end

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end
