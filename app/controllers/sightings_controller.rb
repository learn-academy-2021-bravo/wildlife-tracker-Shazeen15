class SightingsController < ApplicationController
    # As the consumer of the API I can create a sighting of an animal with date (use the datetime datatype), latitude and longitude. Hint: An animal has_many sightings. (rails g resource Sighting animal_id:integer ...)
    # Story: As the consumer of the API I can update an animal sighting in the database.
    # PATCH/PUT /sightings/:id(.:format)=>sightings#update
    def update
        sighting = Sighting.find(params[:id])
        sighting.update(sighting_params)
        if sighting.valid?
            render json: sighting
        else
            render json: sighting.errors
        end
    end
    
    
    # Story: As the consumer of the API I can destroy an animal sighting in the database.
    # Story: As the consumer of the API, when I view a specific animal, I can also see a list sightings of that animal.
    # Story: As the consumer of the API, I can run a report to list all sightings during a given time period.
    # Hint: Your controller can look something like this:
    # class SightingsController < ApplicationController
    #   def index
    #     sightings = Sighting.where(date: params[:start_date]..params[:end_date])
    #     render json: sightings
    #   end
    # end
    # Remember to add the start_date and end_date to what is permitted in your strong parameters method.
    private
    def sighting_params
        params.require(:sighting).permit(:date, :latitude, :longitude)
    end
    
end
