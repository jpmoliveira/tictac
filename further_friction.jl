function fcalcVz2f(vz2i, vy1, w1, a1)
    global e, Geo, h, mu, R
    fatdir = - sign(calcVypc(vy1, w1, a1))
    return ((e - Geo * (h / 2) * cos(a1) * ((h / 2) * cos(a1) - fatdir * mu * ((h / 2) * sin(a1) + R))) * vz2i + (1 + e) * ((w1 * h) / 2) * cos(a1)) / (1 + Geo * (h / 2) * cos(a1) * ((h / 2) * cos(a1) - fatdir * mu * ((h / 2) * sin(a1) + R)))
end

function fcalcVy2f(vz2i, vy1, w1, a1)
    global e, Geo, h, mu, R
    fatdir = - sign(calcVypc(vy1, w1, a1))
    return vy1 + fatdir * mu * (1 + e) * (vz2i + w1 * cos(a1) * h / 2) / (1 + Geo * (h / 2) * cos(a1) * ((h / 2) * cos(a1) - fatdir * mu * ((h / 2) * sin(a1) + R)))
end

function fcalcw2(vz2i, vy1, w1, a1)
    global h, mu, R, e, Geo
    fatdir = - sign(calcVypc(vy1, w1, a1))
    return w1 - ((h / 2) * cos(a1) - fatdir * mu * ((h / 2) * sin(a1) + R)) * (1 + e) * (vz2i + w1 * (h / 2) * cos(a1)) / (1 / Geo + (h / 2) * cos(a1) * ((h / 2) * cos(a1) - fatdir * mu * ((h / 2) * sin(a1) + R)))
end

function fcalcP2f(vz2i, vy1, w1, a1)
    P2i = (vz2i, vy1, w1, a1)
    vz2f = fcalcVz2f(P2i...)
    vy2f = fcalcVy2f(P2i...)
    w2 = fcalcw2(P2i...)
    return (vz2f, vy2f, w2, a1)
end
