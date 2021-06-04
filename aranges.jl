function a0range(vz1, w1)
    global aRange1
    a0range = []
    for a0 in aRange1
        if w1 > 0
            if vz1 > (h / 2) * (1 - sin(a0)) * w1 / ((pi / 2) - a0)
                push!(a0range,a0)
            end
        else
            if vz1 > (h / 2) * (1 - sin(a0)) * abs(w1) / ((pi / 2) + a0)
                push!(a0range,a0)
            end
        end
    end
    return a0range
end

function a1range(vz2f, w2)
    global aRange2
    a1range = []
    for a1 in aRange2
        if w2 > 0
            if (a1 < 90)
                if vz2f > (h / 2) * (1 - sin(a1)) * w2 / ((pi / 2) - a1)
                    push!(a1range, a1)
                end
            else
                if vz2f > (h / 2) * (1 - sin(a1)) * w2 / (3 * (pi / 2) - a1)
                    push!(a1range, a1)
                end
            end
        else
            if (a1 < 90)
                if vz2f > (h / 2) * (1 - sin(a1)) * abs(w2) / ((pi / 2) + a1)
                    push!(a1range, a1)
                end
            else
                if vz2f > (h / 2) * (1 - sin(a1)) * abs(w2) / (a1 - (pi / 2))
                    push!(a1range, a1)
                end
            end
        end
    end
    return a1range
end
