function getHeights(Ps)
    global g
    Hs = []
    for i in 1:length(Ps)
        try
            vz = Ps[2 * i - 1][1]
            if vz > 0
                if i == 1
                    if checka0(Ps[1])
                        push!(Hs, (vz ^ 2) / (2 * g))
                    end
                else
                    push!(Hs, (vz ^ 2) / (2 * g))
                end
            end
        catch
            break
        end
    end
    return Hs
end

function plotNH_H(a0, N::Int64)
    global pre, Hrange
    Hs = []
    for H in Hrange
        P1 = calcP1(H, a0)
        check = Bool
        try
            check = checka0(P1)
        catch
            check = false
        end
        if check
            try
                push!(Hs, getHeights(nbounce(H, a0))[N])
            catch
                push!(Hs, -1)
            end
        else
            push!(Hs, -1)
        end
    end
    return scatter(Hrange, Hs, legend=false, marker = 2, markercolor=[:red], ylims=[0,Hmax]) # Mario
    # return scatter(Hrange, Hs, legend=false, marker = :diamond, markercolor=[:blue], ylims=[0,Hmax]) # Borts
end

function plotNH_a0(H, N::Int64)
    global aRange1
    Hs = []
    for a0 in aRange1
        P1 = calcP1(H, a0)
        if checka0(P1)
            try
                push!(Hs, getHeights(nbounce(H, a0))[N])
            catch
                push!(Hs, -1)
            end
        else
            push!(Hs, -1)
        end
    end
    return scatter(aRange1, Hs, legend=false, marker = 2, markercolor=[:blue], ylims=[0, H]) # Mario
    # return scatter(aRange1, Hs, legend=false, marker = 2, markercolor=[:red], ylims=[0, H]) # Borts
end

function Hratio(Hs)
    Hrs = []
    for i in 1:(length(Hs) - 1)
        push!(Hrs, Hs[i + 1] / Hs[i])
    end
    return Hrs
end

function ratioMatrix(H0, a0)
    global pre, mcadist, mcHdist
    arange = range(a0 - mcadist, a0 + mcadist, length=Int64(ceil(1 / pre)))
    H0range = range(H0 - mcHdist, H0 + mcHdist, length=Int64(ceil(1 / pre)))
    Hrs = zeros(length(H0range), length(arange))
    for i in 1:length(H0range)
        H = H0range[i]
        for j in 1:length(arange)
            a = arange[j]
            if a < a1merda || a > a2merda
                try
                    Hrs[i, j] = Hratio(getHeights(nbounce(H, a)))[1]
                catch
                    Hrs[i, j] = 0
                end
            end
        end
    end
    return Hrs
end

function possa()
    global pre, aRange1, Hrange
    Hrs = zeros(length(Hrange), length(aRange1))
    for i in 1:length(Hrange)
        H = Hrange[i]
        for j in 1:length(aRange1)
            a = aRange1[j]
            try
                theh = Hratio(getHeights(nbounce(H, a)))[1]
                if theh > 1
                    Hrs[i, j] = 1
                end
            catch
                continue
            end
        end
    end
    return Hrs
end

function higherBounceProb(Hrs)
    count = 0
    total = length(Hrs)
    for r in Hrs
        if r > 1
            count += 1
        end
    end
    return (count / total)
end

function heightMatrix(H0, a0)
    global pre, mcadist, mcHdist
    arange = range(a0 - mcadist, a0 + mcadist, length=Int64(ceil(1 / pre)))
    H0range = range(H0 - mcHdist, H0 + mcHdist, length=Int64(ceil(1 / pre)))
    Hs = zeros(length(H0range), length(arange))
    for i in 1:length(H0range)
        H = H0range[i]
        for j in 1:length(arange)
            a = arange[j]
            if a < a1merda || a > a2merda
                try
                    Hs[i, j] = getHeights(nbounce(H, a))[2]
                catch
                    continue
                end
            end
        end
    end
    return Hs
end

function fullRatio()
    global pre, aRange1, Hrange
    Hrs = zeros(length(Hrange), length(aRange1))
    for i in 1:length(Hrange)
        H = Hrange[i]
        for j in 1:length(aRange1)
            a = aRange1[j]
            try
                Hrs[i, j] = Hratio(getHeights(nbounce(H, a)))[1]
            catch
                continue
            end
        end
    end
    return Hrs
end

function fullHeights()
    global pre, aRange1, Hrange
    Hs = zeros(length(Hrange), length(aRange1))
    for i in 1:length(Hrange)
        H = Hrange[i]
        for j in 1:length(aRange1)
            a = aRange1[j]
            try
                Hs[i, j] = getHeights(nbounce(H, a))[2]
            catch
                Hs[i, j] = 0
            end
        end
    end
    return Hs
end
