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
    def sightingsbyanimal
        
    end
    
    
    private
    def animal_params
        params.require(:animal).permit(:common_name, :latin_name, :kingdom)
    end
end
