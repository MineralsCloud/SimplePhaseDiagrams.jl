module SimplePhaseDiagrams

using DataInterpolations

function interpolate(
    x::AbstractVector{<:AbstractVector}, z::AbstractVector{<:AbstractVector}
)
    if length(x) != length(z)
        throw(DimensionMismatch())
    end
    return map(x, z) do xx, zz
        if length(xx) == length(zz)
            CubicSpline(xx, zz)
        else
            throw(DimensionMismatch())
        end
    end
end

apply(interpolators::AbstractVector, x) =
    map(interpolator -> interpolator.(x), interpolators)

apply2d(interpolators::AbstractVector, x) = hcat(apply(interpolators, x)...)

function interpolate_apply(
    x::AbstractVector{<:AbstractVector},
    y::AbstractVector,
    z::AbstractVector{<:AbstractVector},
    new_x=extrema(extrema.(x)),
    new_y,
)
    interpolators = interpolate(x, z)
    mat = apply2d(interpolators, new_x)
    data = map(y, eachrow(mat), new_y) do yy, zz, yyy
        CubicSpline(yy, zz).(yyy)
    end
    return vcat(data...)
end

end
