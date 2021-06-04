function fcalcVz1(H, a0)
    global g, e, h, Geo, mu, R
    return ((e - Geo * (h / 2) * cos(a0) * ((h / 2) * cos(a0) - mu * ((h / 2) * sin(a0) + R))) / (1 + Geo * (h / 2) * cos(a0) * ((h / 2) * cos(a0) - mu * ((h / 2) * sin(a0) + R)))) * sqrt(2 * g * H)
end

function fcalcVy1(H, a0)
    global mu, e, g, Geo, h, R
    return mu * (1 + e) * sqrt(2 * g *H) / (1 + Geo * ((h / 2) * cos(a0) - mu * ((h / 2) * sin(a0) + R)))
end

function fcalcw1(H, a0)
    global Geo, mu, h, R, g, e
    return (mu * ((h / 2) * sin(a0) + R) - (h / 2) * cos(a0)) * ((1 + e) * sqrt(2 * g * H)) / ((1 / Geo) + (h / 2) * cos(a0) * ((h / 2) * cos(a0) - mu * ((h / 2) * sin(a0) + R)))
end

function fcalcP1(H, a0)
    vz1 = fcalcVz1(H, a0)
    vy1 = fcalcVy1(H, a0)
    w1 = fcalcw1(H, a0)
    return (vz1, vy1, w1, a0)
end
