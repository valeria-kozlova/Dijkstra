function [speed, XY,masshtab,time_work_akum,time_zarad] = vvod_dannih()
fid = fopen('Координаты заправок.txt','r');
% fid идентефикатор
if fid == -1
 
    fprintf('Файл не существует, был создан новый.');
    fid = fopen('Координаты заправок.txt','w');
    fprintf(fid,'Исходные данные вариант 10:\r\n');
    fprintf(fid,'Введите скорость:\r\n');
    fprintf(fid,'0\r\n');
    fprintf(fid,'Введите время работы аккумулятора:\r\n');
    fprintf(fid,'0\r\n');
    fprintf(fid,'Введите время зарядки:\r\n');
    fprintf(fid,'0\r\n');
    fprintf(fid,'Масштаб сетки:\r\n');
    fprintf(fid,'0\r\n');    
    fprintf(fid,'%s\r\n','Далее массив координат заправок X Y (координаты X Y через пробел, неограниченное количество.)');
    % s - вектор символов или массив строк. Тип синтезируемого текста совпадает с типом formatSpec.
    fclose(fid);    
    return;
end    
fclose(fid);  
 
 
 
fid = fopen('Координаты заправок.txt','r');
%первую и вторую строку не читаем
fgets(fid);
fgets(fid);
speed = fscanf(fid,'%d\r\n');
 
 
fgets(fid);
time_work_akum = fscanf(fid,'%f\r\n');
 
fgets(fid);
time_zarad = fscanf(fid,'%d\r\n');
%переведем из минут в часы
time_zarad = time_zarad/60;
 
fgets(fid);
masshtab = fscanf(fid,'%d\r\n');
 
%time = input('Введите начальное время: ');
 
x0 = input('Введите начальное значение x: ');
y0 = input('Введите начальное значение y: ');
xEnd = input('Введите конечное значение x: ');
yEnd = input('Введите конечное значение y: ');
 
XY0(1,1) = x0;
XY0(1,2) = y0;
XYEnd(1,1) = xEnd;
XYEnd(1,2) = yEnd;
 
fgets(fid);
XY = fscanf(fid,'%d %d\n\r',[2,Inf]);
fclose(fid);
XY = XY.';
XY = [XY0(1,:);XY(:,:)];
XY = [XY(:,:);XYEnd(1,:)];
end 

