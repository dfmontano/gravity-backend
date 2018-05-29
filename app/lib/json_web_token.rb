class JsonWebToken

  HMAC_SECRET = Rails.application.secrets.secret_key_base

  # To set expiration time pass  exp = 24.hours.from_now as argument
  def self.encode(payload)

    # payload[:exp] = exp.to_i
    JWT.encode(payload, HMAC_SECRET)

  end

  def self.decode(token)

    body = JWT.decode(token, HMAC_SECRET)[0]
    HashWithIndifferentAccess.new body

  rescue JWT::DecodeError => e

    raise ExceptionHandler::InvalidToken, e.message

  end

end