function wert=Anfangslosung(x,y)
  if sqrt((x.-1.0).^2+(y.-1).^2)<=0.05 wert=1;
    else  if sqrt((x.-1.30).^2+(y.-1.3).^2)<=0.03 wert =1;
          else  wert=0;
          endif
  endif
endfunction