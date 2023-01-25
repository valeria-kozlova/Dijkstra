clc; clear;
 
script=input('Меню:\n Выберите, пожалуйста сценарий:\n 1 - загрузка файла с исходными данными;\n 2 - вывод матрицы смежности;\n 3 - вывод матрицы весов\n 4 - нахождение минимального пути;\n 5 - вывод NMEA сообщений;\n 6 - вывод графика; \n', 's');
 
A=sscanf(script, '%d');
 
switch A
 
    case 1
 
[speed, XY,masshtab,time_work_akum,time_zarad] = vvod_dannih;
 
disp('XY = ');
disp(XY);
 
 
    case 2
        
[speed,XY,masshtab,time_work_akum,time_zarad] = vvod_dannih;        
[mat_sme,ves,kvoXY] = vesy(XY,masshtab,speed,time_work_akum, time_zarad);
      
disp('mat_sme = ');
disp(mat_sme);
 
        
    case 3 
        
[speed, XY,masshtab,time_work_akum,time_zarad] = vvod_dannih;        
[mat_sme,ves,kvoXY] = vesy(XY,masshtab,speed,time_work_akum, time_zarad);
      
disp('ves = ');
disp(ves);
        
    case 4
[speed, XY,masshtab,time_work_akum,time_zarad] = vvod_dannih;        
[mat_sme,ves,kvoXY] = vesy(XY,masshtab,speed,time_work_akum, time_zarad);   
[D,S,way_new,P,MIN_way] = Deikstra(kvoXY,ves,masshtab);
 
disp('D ='); %вектор минимальных путей
disp(D*masshtab);
disp('S ='); % вектор индексов учтенных вершин
disp(S);
%вывод матрицы, в которой написано, откуда пришли в данную точку
disp('P =');
disp(P);
disp('way_new =');
disp(way_new); 
disp('MIN_way =');
disp(MIN_way); 
 
    case 5
[speed, XY,masshtab,time_work_akum,time_zarad] = vvod_dannih;        
[mat_sme,ves,kvoXY] = vesy(XY,masshtab,speed,time_work_akum, time_zarad);   
[D,S,way_new,P,MIN_way] = Deikstra(kvoXY,ves,masshtab);
NMEA(way_new,ves,masshtab,XY);
 
    case 6
[speed, XY,masshtab,time_work_akum,time_zarad] = vvod_dannih;        
[mat_sme,ves,kvoXY] = vesy(XY,masshtab,speed,time_work_akum, time_zarad);   
[D,S,way_new,P,MIN_way] = Deikstra(kvoXY,ves,masshtab);
grafic(kvoXY,XY,ves,way_new);
%%out(D, mat_sme, ves, way_new, MIN_way); 
 
end