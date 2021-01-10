module ExceptionHandler  
  extend ActiveSupport::Concern

  # Define custom error subclasses - rescue catches `StandardErrors`
  class AuthenticationError < StandardError; end
  class MissingToken < StandardError; end
  class InvalidToken < StandardError; end

  included do
    # We've defined custom Standard Error sub-classes to help handle exceptions raised. 
    # By defining error classes as sub-classes of standard error, 
    # we're able to rescue_from them once raised.
    rescue_from ActiveRecord::RecordInvalid, with: :four_twenty_two
    rescue_from ExceptionHandler::AuthenticationError, with: :unauthorized_request
    rescue_from ExceptionHandler::MissingToken, with: :four_twenty_two
    rescue_from ExceptionHandler::InvalidToken, with: :four_twenty_two

    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response({ message: e.message }, :not_found)
    end

    private
  
    def four_twenty_two(e)
      json_response({ message: e.message }, :unprocessable_entity)
    end

     def unauthorized_request(e)
      json_response({ message: e.message }, :unauthorized)
    end

    # 기존 코드에서 변형
    # rescue_from ActiveRecord::RecordInvalid do |e|
    #   json_response({ message: e.message }, :unprocessable_entity)
    # end
  end
end