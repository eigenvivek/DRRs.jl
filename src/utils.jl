using LinearAlgebra
using StaticArrays


"""
    get_basis

Given a new vector, construct an orthonormal basis.
"""
function get_basis(a::MVector{3,Float64})
    w = normalize(a)
    t = get_noncollinear_vector(w) |> normalize
    u = cross(t, w)
    v = cross(u, w)
    return u, v, w
end


function get_noncollinear_vector(w)
    t = deepcopy(w)
    i = argmin(abs.(w))
    t[i] = 1
    return t
end
