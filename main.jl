using Roots
using Plots
gr()

include("aranges.jl")
include("bounce.jl")
include("checks.jl")
include("consts.jl")
include("final_state.jl")
include("first_friction.jl")
include("first_no_friction.jl")
include("further_friction.jl")
include("further_no_friction.jl")
include("heights.jl")
include("shows.jl")

# Cada uma das próximas 3 linhas leva 15 min
# allRatios = fullRatio()
# allHeights = fullHeights()
# possA = possa()

# plot1 = showFullRatio(allRatios)
# plot1 = title!("Razão entre as alturas do primeiro e do segundo pulo")
# plot1 = xlabel!("Ângulo inicial (rad)")
# plot1 = ylabel!("Altura inicial (m)")

# plot2 = showFullHeight(allHeights)
# plot2 = title!("Alturas do segundo pulo")
# plot2 = xlabel!("Ângulo inicial (rad)")
# plot2 = ylabel!("Altura inicial (m)")

# plot3 = showFullPoss(possA)
# plot3 = title!("Condições iniciais para ocorrência do fenômeno")
# plot3 = xlabel!("Ângulo inicial (rad)")
# plot3 = ylabel!("Altura inicial (m)")

# png(plot1, "imgs/plot1")
# png(plot2, "imgs/plot2")
# png(plot3, "imgs/plot3")

# plot4 = plotNH_a0(0.5, 1)
# plot4 = title!("Altura do primeiro pulo")
# plot4 = xlabel!("Ângulo incial (rad)")
# plot4 = ylabel!("Altura (m)")

# plot5 = plotNH_a0(0.5, 2)
# plot5 = title!("Altura do segundo pulo")
# plot5 = xlabel!("Ângulo incial (rad)")
# plot5 = ylabel!("Altura (m)")

# plot6 = plotNH_H(1, 1)
# plot6 = title!("Altura do primeiro pulo")
# plot6 = xlabel!("Altura incial (rad)")
# plot6 = ylabel!("Altura (m)")

# plot7 = plotNH_H(0.25, 2)
# plot7 = title!("Altura do segundo pulo")
# plot7 = xlabel!("Altura incial (m)")
# plot7 = ylabel!("Altura (m)")

# png(plot4, "imgs/plot5")
# png(plot5, "imgs/plot6")
# png(plot6, "imgs/plot7")
# png(plot7, "imgs/plot8")

# Leva uns 15 min
H0 = 0.34
a0 = 0.66
# inicial_incerta = heightMatrix(H0, a0)
plot1 = showMCDist(H0, a0, inicial_incerta)

med = sum(inicial_incerta) / length(inicial_incerta)
n = length(inicial_incerta)
soma = 0
for H in inicial_incerta
    global soma
    soma += (H - med) ^ 2
end
desv_q = soma / (n - 1)
desv = sqrt(desv_q)

# plots, Hs, ~ = plotnbounce(0.34, 0.66)
# display(plots[end])
# println(Hs)
