%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Load the data and store the relevant columns in their own variables
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    fid=fopen('DIVR.tenv3.txt');
    C=textscan(fid,'%s %s %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f','headerlines',1);
    fclose(fid);

    t1=C{3};
    x1=C{9};
    y1=C{11};
    z1=C{13};
    
    lat1=C{21}(1); % just need the first value, not the whole column
    %lon1=C{22}(1);
    lon1=38.10388433;

    

    fid=fopen('ARPK.tenv3.txt');
    C=textscan(fid,'%s %s %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f','headerlines',1);
    fclose(fid);

    t2=C{3};
    x2=C{9};
    y2=C{11};
    z2=C{13};

    lat2=C{21}(1);
    %lon2=C{22}(1);
    lon2=38.48732054;

  
    
    fid=fopen('TNCE.tenv3.txt');
    C=textscan(fid,'%s %s %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f','headerlines',1);
    fclose(fid);

    t3=C{3};
    x3=C{9};
    y3=C{11};
    z3=C{13};

    lat3=C{21}(1);
    %lon3=C{22}(1);
    lon3=39.5456332;


    fid=fopen('GURU.tenv3.txt');
    C=textscan(fid,'%s %s %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f','headerlines',1);
    fclose(fid);

    t4=C{3};
    x4=C{9};
    y4=C{11};
    z4=C{13};

    lat4=C{21}(1);
    %lon4=C{22}(1);
    lon4=37.30786945;


    fid=fopen('KAYS.tenv3.txt');
    C=textscan(fid,'%s %s %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f','headerlines',1);
    fclose(fid);

    t5=C{3};
    x5=C{9};
    y5=C{11};
    z5=C{13};

    lat5=C{21}(1);
    %lon5=C{22}(1);
    lon5=35.52446135;

 

    fid=fopen('MALY.tenv3.txt');
    C=textscan(fid,'%s %s %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f','headerlines',1);
    fclose(fid);

    t6=C{3};
    x6=C{9};
    y6=C{11};
    z6=C{13};

    lat6=C{21}(1);
    %lon6=C{22}(1);
    lon6=38.21689;

   

    fid=fopen('ONIY.tenv3.txt');
    C=textscan(fid,'%s %s %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f','headerlines',1);
    fclose(fid);

    t7=C{3};
    x7=C{9};
    y7=C{11};
    z7=C{13};

    lat7=C{21}(1);
    %lon7=C{22}(1);
    lon7=36.25385795;

  

    fid=fopen('MRSI.tenv3.txt');
    C=textscan(fid,'%s %s %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f','headerlines',1);
    fclose(fid);

    t8=C{3};
    x8=C{9};
    y8=C{11};
    z8=C{13};

    lat8=C{21}(1);
    %lon8=C{22}(1);
    lon8=34.60259304;

  


    fid=fopen('ANTP.tenv3.txt');
    C=textscan(fid,'%s %s %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f','headerlines',1);
    fclose(fid);

    t9=C{3};
    x9=C{9};
    y9=C{11};
    z9=C{13};

    lat9=C{21}(1);
    %lon9=C{22}(1);
    lon9=37.37361026;
 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calculate the velocity components
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %
  % calculate the horizontal velocity of each station over the full time series
  %
    Px1=polyfit(t1,x1,1);  vx1=Px1(1);
    Py1=polyfit(t1,y1,1);  vy1=Py1(1);
    Px2=polyfit(t2,x2,1);  vx2=Px2(1);
    Py2=polyfit(t2,y2,1);  vy2=Py2(1);
    Px3=polyfit(t3,x3,1);  vx3=Px3(1);
    Py3=polyfit(t3,y3,1);  vy3=Py3(1);
    Px4=polyfit(t4,x4,1);  vx4=Px4(1);
    Py4=polyfit(t4,y4,1);  vy4=Py4(1);
    Px5=polyfit(t5,x5,1);  vx5=Px5(1);
    Py5=polyfit(t5,y5,1);  vy5=Py5(1);
    Px6=polyfit(t6,x6,1);  vx6=Px6(1);
    Py6=polyfit(t6,y6,1);  vy6=Py6(1);
    Px7=polyfit(t7,x7,1);  vx7=Px7(1);
    Py7=polyfit(t7,y7,1);  vy7=Py7(1);
    Px8=polyfit(t8,x8,1);  vx8=Px8(1);
    Py8=polyfit(t8,y8,1);  vy8=Py8(1);
    Px9=polyfit(t9,x9,1);  vx9=Px9(1);
    Py9=polyfit(t9,y9,1);  vy9=Py9(1);
    
  %
  % calculate the magnitude and direction of each velocity vector
  %  - atan gives the "regular" 2-quadrant arctangent result
  %  - atan2 gives the 4-quadrant arctangent result in radians
  %  - atan2d gives the 4-quadrant arctangent result in degress: use this one
  %
    v1=sqrt(vx1^2+vy1^2);  th1=90-atan2d(vy1,vx1); % 90- because by default, angle is degrees CCW from east
    v2=sqrt(vx2^2+vy2^2);  th2=90-atan2d(vy2,vx2); % 90- because by default, angle is degrees CCW from east
    v3=sqrt(vx3^2+vy3^2);  th3=90-atan2d(vy3,vx3); % 90- because by default, angle is degrees CCW from east
    v4=sqrt(vx4^2+vy4^2);  th4=90-atan2d(vy4,vx4); % 90- because by default, angle is degrees CCW from east
    v5=sqrt(vx5^2+vy5^2);  th5=90-atan2d(vy5,vx5); % 90- because by default, angle is degrees CCW from east
    v6=sqrt(vx6^2+vy6^2);  th6=90-atan2d(vy6,vx6); % 90- because by default, angle is degrees CCW from east
    v7=sqrt(vx7^2+vy7^2);  th7=90-atan2d(vy7,vx7); % 90- because by default, angle is degrees CCW from east
    v8=sqrt(vx8^2+vy8^2);  th8=90-atan2d(vy8,vx8); % 90- because by default, angle is degrees CCW from east
    v9=sqrt(vx9^2+vy9^2);  th9=90-atan2d(vy9,vx9); % 90- because by default, angle is degrees CCW from east
    
    
  %
  % print out velocity components to the screen, just to check that they make sense
  %   columns: vx, vy, v in m, and azimuth in degrees
  %
    [vx1,vy1,v1,th1;vx2,vy2,v2,th2;vx3,vy3,v3,th3;vx4,vy4,v4,th4;vx5,vy5,v5,th5;vx6,vy6,v6,th6;vx7,vy7,v7,th7;vx8,vy8,v8,th8;vx9,vy9,v9,th9];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot the velocity vectors on a map
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %
  % load coastline data and political boundary data
  % Start a map plot
  %
    c=load('coastfile.xy.txt');
    b=load('politicalboundaryfile.xy.txt');
    
    figure(1),clf
    plot(c(:,1),c(:,2),'k',b(:,1),b(:,2),'k:')



    
  %
  % plot the stations as squares and 
  % velocity vectors as arrows on the map
  % zoom in to region of interest
  %
    hold on
    plot(lon1,lat1,'s',lon2,lat2,'s',lon3,lat3,'s',lon4,lat4,'s',lon5,lat5,'s',lon6,lat6,'s',lon7,lat7,'s',lon8,lat8,'s',lon9,lat9,'s');
    quiver([lon1;lon2;lon3;lon4;lon5;lon6;lon7;lon8;lon9],[lat1;lat2;lat3;lat4;lat5;lat6;lat7;lat8;lat9],[vx1;vx2;vx3;vx4;vx5;vx6;vx7;vx8;vx9],[vy1;vy2;vy3;vy4;vy5;vy6;vy7;vy8;vy9],'k');
    axis([27      43       35       43]);

%%% Plotting surface rupture & fault line 

S = shaperead ("surface_rupture_lines_public_2023-02-17.shp");
   mapshow (S);

   F = shaperead ("simple_fault_2023-2-17.shp");
   mapshow (F);
