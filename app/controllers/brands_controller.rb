class BrandsController < ApplicationController

    def index #GET /brands
        @brands = Brand.all
        render json: @brands, status: :ok, include: :cereals
    end

    def show #GET /brands/:id
        @brand = Brand.find params[:id]
        render json: @brand, status: :ok, include: :cereals 
    end

    def create #POST / brands
        #@brand = Brand.create(brand_name: params[:brand_name], 
            #brand_image: params[:brand_image],
            #brand_rating: params[:brand_rating])
        #render json: @brand, status: :created

        @brand = Brand.new(
            brand_name: params[:brand_name],
            brand_image: params[:brand_image],
            brand_rating: params[:brand_rating],
        )

        if @brand.valid?
            @brand.save
            render json: @brand, status: :created
        else 
            render json: { errors: @brand.errors.full_messages}, status: :unprocessable_entity
        end

    end

    def update #PATCH/PUT /brand/:id
        @brand = Brand.find params[:id]
        @brand.update(brand_name: params[:brand_name], 
            brand_image: params[:brand_image],
            brand_rating: params[:brand_rating])
        render json: @brand, status: :ok
    end

    def destroy #DELETE /brands/:id
        @brand = Brand.find params[:id]
        @brand.destroy
    end



end
