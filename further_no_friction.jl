function calcVz2f(vz2i, vy1, w1, a1)
    global e, Geo, h, R
    return ((e - Geo * (h / 2) * cos(a1) * ((h / 2) * cos(a1))) * vz2i + (1 + e) * ((w1 * h) / 2) * cos(a1)) / (1 + Geo * (h / 2) * cos(a1) * ((h / 2) * cos(a1)))
end

function calcw2(vz2i, vy1, w1, a1)
    global h, mu, R, e, Geo
    fatdir = - sign(calcVypc(vy1, w1, a1))
    return w1 - ((h / 2) * cos(a1) - fatdir * mu * ((h / 2) * sin(a1) + R)) * (1 + e) * (vz2i + w1 * (h / 2) * cos(a1)) / (1 / Geo + (h / 2) * cos(a1) * ((h / 2) * cos(a1) - fatdir * mu * ((h / 2) * sin(a1) + R)))
end

function calcP2f(vz2i, vy1, w1, a1)
    P2i = (vz2i, vy1, w1, a1)
    vz2f = calcVz2f(P2i...)
    vy2f = vy1
    w2 = calcw2(P2i...)
    return (vz2f, vy2f, w2, a1)
end
