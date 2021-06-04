function calcVz1(H, a0)
    global g, e, h, Geo, R
    return ((e - Geo * (((h / 2) * cos(a0)) ^ 2)) / (1 + Geo * (((h / 2) * cos(a0)) ^ 2))) * sqrt(2 * g * H)
end

function calcw1(H, a0)
    global Geo, h, R, g, e
    return -(h / 2) * cos(a0) * (1 + e) * sqrt(2 * g * H) / ((1 / Geo) + ((h / 2) * cos(a0)) ^ 2)
end

function calcP1(H, a0)
    global carteia_mlk
    vz1 = calcVz1(H, a0)
    vy1 = carteia_mlk * abs(fcalcVy1(H, a0)) # 0
    if a0 > a1merda && a0 < a2merda
        vy1 = 4 * H
    end
    w1 = calcw1(H, a0)
    return (vz1, vy1, w1, a0)
end
