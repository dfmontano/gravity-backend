module Response

  def json_response(object, status = :ok, include = [], methods=[], except=[])

    render json: object, :include => include ,status: status, methods: methods, except: except

  end

end