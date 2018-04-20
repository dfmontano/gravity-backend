module Response

  def json_response(object, status = :ok, include = [])

    render json: object, :include => include ,status: status

  end

end