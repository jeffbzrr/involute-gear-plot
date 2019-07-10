//JEFFERSON BEZERRA

clear
clf()
axis=gca()
axis.thickness = 3

//--------------------------------------
//DADOS DE ENTRADA
m = 10 //módulo
z = 25 //número de dentes
alfa = 13 //ângulo de pressão em graus
xc = 0.05 //correção
n = 250 // número de pontos
//--------------------------------------

alfa = alfa * (%pi/180)

hh = (1+xc)*m //adendo
hf = (1.25-xc)*m //dedendo
dp = m*z //diâmetro primitivo
rp = dp/2 //raio primitivo
db = dp*cos(alfa) //diâmetro de base
rb = db/2
di = dp-2*hf //diâmetro interno
de = dp+2*hh //diâmetro externo
re = de/2
ri = di/2

//coordenadas dos vetores
rb_array = ones(1,n)*rb
rp_array = linspace(rb,re,n)
rt_array = linspace(ri,rp,n)

//curva evolvente
alfap = acos(rb_array./rp_array)
Ev = tand(alfa)-alfa
teta_ = (%pi/2*z)+(2*xc*tan(alfa)/z)+Ev
tetap = tan(alfap)-alfap
Xp = rp_array.*sin(teta_-tetap)
Yp = rp_array.*cos(teta_-tetap)
plot(Xp, Yp,'k-')

//curva trocoidal
sigma = alfa - (((rp-hh)*tan(alfa))/rp)
tetat = (atan(sqrt((rt_array.^2)-((rp-hf)^2))/(rp-hf))) -  (   sqrt((rt_array.^2)-((rp-hf)^2))   /rp   )
Xt = rt_array.*sin(teta_+sigma-tetat)
Yt = rt_array.*cos(teta_+sigma-tetat)
plot(Xt, Yt,'b-')

//círculos interno e externo
teta_i = linspace(0,%pi/2,200)
x_i = ri*cos(teta_i)
y_i = ri*sin(teta_i)
//plot(x_i,y_i)
teta_e = linspace(0,%pi/2,200)
x_e = re*cos(teta_e)
y_e = re*sin(teta_e)
//plot(x_e,y_e,'b-')
