class SightingSerializer
  
  def initialize(sighting_object)
    @sighting = sighting_object 
  end 
  
  def to_serialized_json 
    @sighting.to_json(:include => {
      :bird => {:only => [:name, :species]},
      :location => {:only => [:latitude, :longitude]}
    }, :except => [:updated_at])
  end 
  
  #OR: def to_serialized_json
#   options = {
#     include: {
#       bird: {
#         only: [:name, :species]
#       },
#       location: {
#         only: [:latitude, :longitude]
#       }
#     },
#     except: [:updated_at],
#   }
#   @sighting.to_json(options)
# end

#Above, we define a variable, options, assigning it to a hash. We then define two keys on that hash, :include and :except, and assign them the same values as before. Finally, at the end of the method, instead of filling to_json with a long list of options, we pass in the options hash.
  
end

