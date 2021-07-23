# frozen_string_literal: true

class K8sController < ApplicationController
  def healthz
    head K8s::Healthz.call
                     .either ->(_) { :ok },
                             ->(_) { :internal_server_error }
  end
end
