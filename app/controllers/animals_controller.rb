class AnimalsController < ApplicationController
    #  As the consumer of the API I can list all the animals in a database.
    # animals GET /animals(.:format)=>animals#index
    def index
        animals = Animal.all
        render json: animals
    end
    # As the consumer of the API I can update an animal in the database.
    # PATCH/PUT /animals/:id(.:format)=>animals#update
    def update
        animal = Animal.find(params[:id])
        animal.update(animal_params)
        if animal.valid?
            render json: animal
        else
            render json: animal.errors
        end
    end
    
    # As the consumer of the API I can destroy a animal in the database.
    # DELETE /animals/:id(.:format) => animals#destroy
    def destroy
        animal = Animal.find(params[:id])
        if animal.destroy
        render json: animal
        else
        render json: animal.errors
        end
    end
    # Story: As the consumer of the API, when I view a specific animal, I can also see a list sightings of that animal.
    # animals get /animals/:id/sightings=>animals#sightingsbyanimal
    def sightingsbyanimal
        animal = Animal.find(params[:id])
        sightings = Sighting.all
        all_sights = sightings.select do |sight|
            if sight.animal_id == animal.id
                sight
            else
                sight.errors
            end
        end
        render json: all_sights
    end
    # Story: As the consumer of the API, I can submit sighting data along with new animals in 1 api call
    # Look into accepts_nested_attributes_for
    # POST /animals(.:format)=>animals#create
    def create
        animal = Animal.create(animal_params)
        if animal.valid?
            render json: animal
        else
        r   ender json: animal.errors
        end
    end

    # def create
    #     @recipe = current_user.recipes.build(recipe_params)
    #     if @recipe.save
    #         flash[:success] = "New recipe created correctly."
    #         redirect_to @recipe
    #     else
    #       render 'new'
    #     end
    # end 
    
    
    private
    def animal_params
        params.require(:animal).permit(:common_name, :latin_name, :kingdom, sightings_attributes: [:id, :date, :latitude, :longitude, :animal_id])
    end
end
