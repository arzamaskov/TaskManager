class Api::ApplicationController < ApplicationController
  def self.responder
    JsonResponder
  end
end
