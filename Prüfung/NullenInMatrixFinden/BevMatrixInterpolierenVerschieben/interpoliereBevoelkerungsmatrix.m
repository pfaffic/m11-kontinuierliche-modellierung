## Copyright (C) 2020 chris
## 
## This program is free software: you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see
## <https://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} interpoliereBevoelkerungsmatrix (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: chris <chris@PFAFFMANN-PC>
## Created: 2020-08-12

function [IntBevMatrix,M,N,h] = interpoliereBevoelkerungsmatrix (BevMatrix, RasterlaengeInMetern)
 close all;
 m = rows(BevMatrix);
 n = columns(BevMatrix);
 
 h = RasterlaengeInMetern/1000; %Schrittweite in km.
 AnzahlRasterProKilometer = floor(1/h);
 
 M = m * AnzahlRasterProKilometer+1;
 N = n * AnzahlRasterProKilometer+1;
 
 hilfsM = M-AnzahlRasterProKilometer+1;
 hilfsN = N-AnzahlRasterProKilometer+1;
 
 x = 0.5:1:n-0.5;
 y = 0.5:1:m-0.5;
 
 xi = linspace (min (x), max (x), hilfsN); %Anzahl der Unterteilungen
 yi = linspace (min (y), max (y), hilfsM)'; %Anzahl der Unterteilungen
 hilfsBevMatrix = interp2 (x,y,BevMatrix,xi,yi,"cubic");
 
 xxi = linspace (min (x)-0.5, max (x)+0.5, N); %Anzahl der Unterteilungen
 yyi = linspace (min (y)-0.5, max (y)+0.5, M)'; %Anzahl der Unterteilungen
 
 IntBevMatrix = griddata(xi,yi,hilfsBevMatrix,xxi,yyi,"nearest"); %Extrapolation 
 
 
 if(true)
   figure(1001)
   surface (xxi,yyi,IntBevMatrix);
   [x,y] = meshgrid (x,y);
   hold on;
   plot3 (x,y,BevMatrix,"ro");
   title ("Bevoelkerungsdichte Landau");
   ylabel("y")
   xlabel("x")
   colorbar
   hold off;
 endif
endfunction
