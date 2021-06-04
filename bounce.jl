function nbounce(H, a0, n::Int64=2)
    Ps = [calcP1(H, a0)]
    for i in 1:n-1
        push!(Ps, calcP2i(Ps[end]...))
        push!(Ps, fcalcP2f(Ps[end]...))
    end
    return Ps
end

function plotbounce(P, y0)
    global pre, g, shit
    vz1 = P[1]
    vy1 = P[2]
    w1 = P[3]
    a0 = P[4]
    tc = calctc(vz1, w1, a0)
    if typeof(tc) == true
        push!(shit, "Aí tu me fodeu")
        return
    end
    y(t) = y0 + vy1 * t
    z(t) = (h / 2) * sin(a0) + R + vz1 * t - (g / 2) * t ^ 2
    plot1 = plot!(y, z, 0, tc, leg=false)
    return plot1, y(tc)
end

function plotnbounce(H, a0, n::Int64=2)
    Ps = nbounce(H, a0, n)
    checks = [checka0(Ps[1])]
    auxplot = plot(0, 0, ylims = (0, H))
    plots = [auxplot]
    ycs = [0.0]
    Hs = getHeights(Ps)
    for i in 1:n
        try
            (plot, yc) = plotbounce(Ps[2 * i - 1], ycs[end])
            push!(checks, checka1(Ps[2 * i - 1]))
            push!(plots, plot)
            push!(ycs, yc)
        catch
            return plots, Hs, checks
        end
    end
    return plots, Hs, checks
end
