function showMCDist(H, a0, Hs::Matrix{Float64})
    global mcadist, mcHdist, pre
    arange = range(a0 - mcadist, a0 + mcadist, length=Int64(ceil(1 / pre)))
    H0range = range(H - mcHdist, H + mcHdist, length=Int64(ceil(1 / pre)))
    heatmap(arange, H0range, Hs) # Borts
    # heatmap(arange, H0range, Hs, c = :ice) #Mario
end

function showFullHeight(Hs::Matrix{Float64})
    global pre, Hmax
    arange = 0:pre:pi/2
    H0range = 0:pre:Hmax
    heatmap(arange, H0range, Hs, clim = (0, Hmax)) # Borts
    # heatmap(arange, H0range, Hs, clim = (0, Hmax), c = :ice) # Mario
end

function showFullRatio(Hrs::Matrix{Float64})
    global pre, Hmax
    arange = 0:pre:pi/2
    H0range = 0:pre:Hmax
    heatmap(arange, H0range, Hrs, clim = (0, 10)) # Borts
    # heatmap(arange, H0range, Hrs, clim = (0, 10), c = :ice) # Mario
end

function showFullPoss(Hrs::Matrix{Float64})
    global pre, Hmax
    arange = 0:pre:pi/2
    H0range = 0:pre:Hmax
    heatmap(arange, H0range, Hrs, clim = (0, 1), legend = :none) # Borts
    # heatmap(arange, H0range, Hrs, clim = (0, 1), legend = :none, c = :ice)
end
