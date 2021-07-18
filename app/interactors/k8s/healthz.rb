# frozen_string_literal: true

module K8s
  class Healthz < BaseInteractor
    include Dry::Monads[:result, :try]

    option :db_probe, default: proc { -> { ActiveRecord::Base.connection.active? } }

    def call
      db_ok.or Failure()
    end

    private

    def db_ok
      Try { db_probe.call }
        .to_result
        .bind { |ok| ok ? Success() : Failure() }
    end
  end
end
