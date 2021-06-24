class CerealsController < ApplicationController

    def index
        @cereals = Cereal.all
        render json: @cereals, status: :ok, include: :brands
    end

    def show #GET /brands/:id
        @cereal = Cereal.find params[:id]
        render json: @cereal, status: :ok, include: :brands
    end

    def create #POST / brands
        #@brand = Brand.create(brand_name: params[:brand_name], 
            #brand_image: params[:brand_image],
            #brand_rating: params[:brand_rating])
        #render json: @brand, status: :created

        @cereal = Cereal.new(
            cereal_name: params[:cereal_name],
            cereal_image: params[:cereal_image],
            cereal_rating: params[:cereal_rating],
        )
    end

    def update #PATCH/PUT /brand/:id
        @cereal = Cereal.find params[:id]
        @cereal.update(
            cereal_name: params[:cereal_name], 
            cereal_rating: params[:ceral_rating],
            cereal_image: params[:cereal_image])
        render json: @cereal, status: :ok
    end


    def create
        @cereal = Cereal.create(
            cereal_name: params[:cereal_name],
            cereal_image: params[:cereal_image],
            cereal_rating: params[:cereal_rating],
        )
        render json: @cereal, include: :brands, status: :created
    end

    def destroy #DELETE /cereals/:id
        @cereal = Cereal.find params[:id]
        @cereal.destroy
    end

end
