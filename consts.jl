# Constantes relacionadas à tic tac

e = 0.87       # coeficiente de restituição
R = 0.0035     # raio da tictac (m)
mu = 0.15     # coeficiente de atrito, 0.432
h = 0.0047     # altura da tictac (m)
g = 9.8        # gravidade

Geo = (20*(3*h+4*R))/(5*(h^3)+20*(h^2)*R+45*h*R^2+32*(R^3))   # Depende apenas da geometria da capsula (m/I)


# Constantes relacionadas à simulação

pre = 0.001            # precisão
mcadist = 0.009        # incerteza do ângulo
mcHdist = 0.0005       # incerteza da altura
shit = Array{String}   # shit happens
carteia_mlk = 1        # carteação 4 life

wmax = 1000   # valor máximo da velocidade angular
Hmax = 0.5    # valor máximo da altura de queda

f(a) = (h / 2) * cos(a) - mu * ((h / 2) * sin(a) + R)
amerda = find_zero(f, 0.5)
a1merda = amerda + 0.002
a2merda = amerda + 0.008
Hrange = [H for H in 0:pre:Hmax]
aRange1 = [a for a in 0:pre:pi/2]   # Conveniência acima de tudo
aRange2 = [a for a in 0:pre:pi]     # Preguiça acima de todos
