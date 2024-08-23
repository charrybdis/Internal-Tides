# Create topography 

using Oceananigans
using Oceananigans.Units

@inline function create_topography_function(sp::NamedTuple)
    
    # Gaussian topography
    @inline hill(x, y) = (sp.h₀)meters * exp((-x^2 - y^2)/ (2(((sp.width)meters)^2)))
    @inline bottom(x, y) = - (sp.H)meters + hill(x, y)
    
    topographies = (; gaussian = bottom(x, y))
end
