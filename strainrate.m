clear

% Algorithm for computing strain rate between three GPS stations

% Load the data
%
  %fid=fopen('P404.NA.tenv3.txt');
%fid=fopen('P396.NA.tenv3.txt');
%fid=fopen('P395.NA.tenv3.txt');
  %C=textscan(fid,'%s %s %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f','headerlines',1);
  %fclose(fid);

 % converting latlon into UTM
  %stationlat=C{21}(1);
 % stationlon=C{22}(1);
%ll2utm (stationlat, stationlon)

% center of triangle formed by the three GPS stations
x = {(432400+435500+469300)/3};
y = {(4985800+5017700+5000600)/3};

%station395 = {(432400-x), (4985800-y)}
%station396 = {(435500-x), (5017700-y)}
%station404 = {(469300-x), (5000600-y)}
%station395 = {-13330,-15600}
%station396 = {-10230,16300}
%station404 = {23570,-800}
m1 = [("-13330, -15600"); ("-10230, 16300"); ("23570,-800")];
% m2 is a square matrix
m2 = [("1 0 15600 -13330 -15600 0"); ("0 1 -13330 0 -13330 -15600"); ("1 0 -16300 -10230 16300 0"); ("0 1 -10230 0 -10230 16300"); ("1 0 800 23570 -800 0"); ("0 1  23570 0 23570 -800")];
m3 = inv(m2);
m4 = [st395vx st395vy st396vx st396vy st404vx st404vy];
m5 =m3*m4 =[tx ty omega exx exy eyy]