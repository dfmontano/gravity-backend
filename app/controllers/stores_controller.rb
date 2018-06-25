class StoresController < ApplicationController

  skip_before_action :authorize_request, only: [:show, :index, :index_by_subcategory]

  # TODO Change celular and ruc column types to string

  # GET /stores/index
  def index
    @stores = Store.all
    json_response(@stores, :ok)
  end

  def index_by_subcategory
    @stores = Store.where(subcategory_id: params[:subcategory_id])
    if @stores
      json_response(@stores, :ok)
    else
      json_response({message: 'No hay tiendas en esta categoria'}, 404)
    end
  end

  # GET /stores/:id
  def show
    @store = Store.find_by(id: params[:id])
    json_response(@store, :ok, [:category, :subcategory, :images])
  end

  # POST /stores/create
  def create
    store = Store.create(store_params)
    if store.save
      response = {message: 'Tienda creada correctamente'}
      json_response(response, :created)
    else
      render :json => store.errors, status: :unprocessable_entity
    end
  end

  # DELETE /stores/:id
  def destroy
    @store = Store.find_by(id: params[:id])
    if @store
      @store.destroy
      render :json => {message: 'Tienda eliminada'}, status: 200
    else
      render :json => {error: 'not-found'}, status: 404
    end
  end


  private

  def store_params

    params.permit(:id, :nombre, :descripcion, :slogan, :fijo, :celular,
                  :propietario, :ruc, :calle_principal, :calle_secundaria, :sector,
                  :latitud, :longitud, :referencia, :webpage_link, :facebook_link, :twitter_link,
                  :instagram_link, :category_id, :subcategory_id, images:[])

  end

end