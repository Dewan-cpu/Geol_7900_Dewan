clear


%file names

filename='ridgecrest_after.tif';
filename2='ridgecrest_before.tif';


%read in data from geotiff
[array,metadata]=geotiffread(filename);
x=metadata.XWorldLimits;
y=metadata.YWorldLimits;
z=flipud(array);
z(find(z==-9999))=NaN;

figure(1),clf
imagesc(x/1e3,y/1e3,z)
axis xy
colorbar

[array2,metadata2]=geotiffread(filename2);
x2=metadata2.XWorldLimits;
y2=metadata2.YWorldLimits;
z2=flipud(array2);
z2(find(z2==-9999))=NaN;

figure(2),clf
imagesc(x2/1e3,y2/1e3,z2)
axis xy
colorbar

%% Vertical Difference

d=z -z2;

[array3,metadata3]=geotiffread(d);
x3=metadata2.XWorldLimits;
y3=metadata2.YWorldLimits;
z3=flipud(array3);
z3(find(d==-9999))=NaN;

figure(3),clf
imagesc(x3/1e3,y3/1e3,d)
axis xy
axis equal
colorbar
caxis([-1,1])
colormap(cpolar)



