// Distance Vector
dist = (0.75:0.25:15)
//Num. elements dist. vector
sz = length(dist)
//Width Mona Lisa Painting
width = 0.53
//Height Mona Lisa Painting
height = 0.77
//Focus lenght
f = 0.008

//Dimension of a pixel
sp = 0.00000408

//Total pixels width & height sensor
wp = 1288
hp = 728
//Loop for each distance
for i = 1:sz
    //Calculate angles for each dist
    alphaW = 2*atan((width/2)/dist(i))
    alphaH = 2*atan((height/2)/dist(i))
    //Calculate dimensions in camera's sensor
    camW = (tan(alphaW/2))*2*f
    camH = (tan(alphaH/2))*2*f
    //Caculate number of pixels (must be int, it is discrete)
    pixelsW = int(camW/sp)
    //Compare pixelsW with total pixels width in sensor
    if pixelsW > wp then 
        pixelsW = wp
    end
    pixelsH = int(camH/sp)
    //Compare pixelsW with total pixels width in sensor,
    //truncated if pixelsH is higher than hp
    if pixelsH > hp then 
        pixelsH = hp
    end
    //Vector with all pixels values
    vecPixels(i) = pixelsW*pixelsH
end
disp(vecPixels)

//Draw graph
plot(dist,vecPixels','r')
//Write axis-labels and title on the graph
xlabel('Distance (m)','fontsize',4)
ylabel ('Num. pixels','fontsize',4)
title('Mona Lisa graph','fontsize',8,'color','green')
