ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # In our app the model is ItemVenda but the table (and fixture file) is
    # named `itens_vendas`. Rails can't infer the class automatically, so we
    # tell it explicitly. This also enables association shorthand like
    # `produto: one` inside the fixture yaml.
    set_fixture_class itens_vendas: ItemVenda

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
  end
end

module ActionDispatch
  class IntegrationTest
    include Devise::Test::IntegrationHelpers
  end
end
