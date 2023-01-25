function [ZZ] = azimut(XY,way_new,i)
      
       st1 = XY(way_new(i+1),2) - XY(way_new(i),2);
       st2 = XY(way_new(i+1),1) - XY(way_new(i),1);
       ZZ = atan(st1/st2) * (180/pi);
       if  (ZZ < 0) 
           ZZ = ZZ + 360;
       end
end