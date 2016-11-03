#para solucionar los fallos se añaden como modelos de intervención
#time series
#librerias----
library(quantmod)
library(forecast)
library(plotly)
library(dynlm)
#cargar la serie----
getSymbols("ITAPROINDMISMEI", src = "FRED")
PIBItalia<-ITAPROINDMISMEI
#descriptovo de la serie----
plot(PIBItalia)
xy<-window(PIBItalia,start="1955-01-01",end = "1968-01-01")
#hace rla serie estacionaria----
acf(xy)
X = diff(log(xy))
X=X[-1]
par(mfrow=c(1,2))
acf(X)
pacf(X)
mA<-auto.arima(xy[1:120],seasonal=T)
