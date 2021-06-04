function a(a0, w, t)
    at = a0 + w * t
    if at > 0
        at %= pi
    else
        at = pi + at % pi
    end
end

function calctc(vz1, w1, a0)
    global g, h, R
    H(t) = (h / 2) * sin(a0) + R + vz1 * t - (g / 2) * t ^ 2
    fb(t) = H(t) - h / 2 - R
    gb(t) = H(t) - (h / 2) * sin(a(a0, w1, t)) - R
    tmin = find_zeros(fb, vz1 / g, 2 * vz1 / g)[1]
    if length(tmin) == 0
        return false
    else
        tc = find_zero(gb, tmin)
        return tc
    end
end

function calcP2i(vz1, vy1, w1, a0)
    global g, R
    tc = calctc(vz1, w1, a0)
    vz2i = abs(vz1 - g * tc)
    a1 = a(a0, w1, tc)
    if a1 > 0
        a1 %= pi
    else
        a1 = pi + a1 % pi
    end
    return (vz2i, vy1, w1, a1)
end

function calcVypc(vyi, w1, a1)
    global h, R
    vypc = vyi + w1 *((h / 2) * sin(a1) + R)
    if vypc == 0
        return 1.0
    else
        return vypc
    end
end
