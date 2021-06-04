function checka0(P)
    (vz1, ~, w1, a0) = P
    arange = a0range(vz1, w1)
    if a0 > arange[1] && a0 < arange[end]
        return true
    else
        return false
    end
end

function checka1(P)
    (vz2f, ~, w2, a1) = P
    arange = a1range(vz2f, w2)
    if a1 > arange[1] && a1 < arange[end]
        return true
    else
        return false
    end
end
