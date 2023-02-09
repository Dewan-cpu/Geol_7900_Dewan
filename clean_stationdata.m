clear


%
% clean the data from one messy station
%

   %!curl http://geodesy.unr.edu/gps_timeseries/tenv3/plates/NA/LAIB.NA.tenv3 > BTON.NA.tenv3

%
% Load the data
%
  fid=fopen('LAIB.NA.tenv3.txt');
  C=textscan(fid,'%s %s %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f','headerlines',1);
  fclose(fid);

  tyr=C{3}; % time in decimal year as before
  t=datenum(C{2},'yymmmdd'); % time in "Matlab time", sequential days
  x=C{9};
  y=C{11};
  z=C{13};

  stationlat=C{21}(1);
  stationlon=C{22}(1);
  %
% Plot the data
%  - note the "datetick", since the x axis is now a date number
%
  figure(1),clf,
  subplot(311),plot(t,x,'.-'),datetick,grid,ylabel('east (m)'),title('original raw data')
  subplot(312),plot(t,y,'.-'),datetick,grid,ylabel('north (m)')
  subplot(313),plot(t,z,'.-'),datetick,grid,ylabel('elevation (m)')

  %
% fill the gaps in the data with NaNs, and make a continuous time vector
%  - note how the time and data vectors get longer
%  - we'll save a copy of the old version, for our reference
%
  t_orig=t;
  x_orig=x;
  y_orig=y;
  z_orig=z;


  length(t_orig)

  dt=1; % samle interval: 1=daily

  [t,x]=filltimegap(t_orig,x_orig,dt);
  [t,y]=filltimegap(t_orig,y_orig,dt);
  [t,z]=filltimegap(t_orig,z_orig,dt);

  figure(2),clf,
  subplot(311),plot(t,x,'.-'),datetick,grid,ylabel('east (m)'),title('gaps filled with NaNs')
  subplot(312),plot(t,y,'.-'),datetick,grid,ylabel('north (m)')
  subplot(313),plot(t,z,'.-'),datetick,grid,ylabel('elevation (m)')

  t_NaNgaps=t;
  x_NaNgaps=x;
  y_NaNgaps=y;
  z_NaNgaps=z;


  length(t_NaNgaps)

  %
% deal with the jump in the vertical component
%
  tjump=datenum([2017 8 8]); % jump happens ~ on this date
  iafter=find(t>tjump); % these are the points that we'll change
  jump_amount= -1.46; % this is a guestimate based on the figures...
  z(iafter)=z(iafter)-jump_amount;

  figure(3),clf,
  subplot(311),plot(t,x,'.-'),datetick,grid,ylabel('east (m)')
  subplot(312),plot(t,y,'.-'),datetick,grid,ylabel('north (m)')
  subplot(313),plot(t,z,'.-'),datetick,grid,ylabel('elevation (m)'),title('vertical jump fixed')

%
% deal with outliers in the northings component
%
  ycutoff=-0.2; % outliers seem to be below this level
  ibad=find(y<ycutoff); % these are the points we'll change
  y(ibad)=NaN; % replace with NaN

  figure(4),clf,
  subplot(311),plot(t,x,'.-'),datetick,grid,ylabel('east (m)')
  subplot(312),plot(t,y,'.-'),datetick,grid,ylabel('north (m)'),title('northing outliers fixed')
  subplot(313),plot(t,z,'.-'),datetick,grid,ylabel('elevation (m)')

%
% deal with outliers in the eastings component
%  - these are trickier to identify... need conditions on both t and x...
%
  xcutoff=2.6; % outliers seem to be below this level... but early data has legit values below this
  tcutoff=datenum([2017 8 2]); 
  ibad=find(x<xcutoff & t>tcutoff); % combine two different conditions using the "&"
  x(ibad)=NaN; % replace with NaN

  figure(5),clf,
  subplot(311),plot(t,x,'.-'),datetick,grid,ylabel('east (m)'),title('easting outliers fixed')
  subplot(312),plot(t,y,'.-'),datetick,grid,ylabel('north (m)')
  subplot(313),plot(t,z,'.-'),datetick,grid,ylabel('elevation (m)')
  datestr(736915)