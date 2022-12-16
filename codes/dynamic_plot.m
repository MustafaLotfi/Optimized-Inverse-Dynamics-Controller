function dynamic_plot(vars)
t = vars.t;
x = vars.x;
x_d = vars.x_d;
u = vars.u;
j = vars.j;
d = vars.d;
k = vars.k;

n = numel(t);

x_min = min(x(1, :));
x_max = max(x(1, :));

domain = x_max - x_min;
x_base = x_min - 1.2*domain;

box_w = 0.15 * domain;
box_h = 0.1 * domain;

borders = [0, 0.3*domain, x_base-0.2 * domain, x_max+0.2 * domain];

k1_x = [0.1*domain
    0.1*domain
    0.08*domain
    0.12*domain
    0.08*domain
    0.12*domain
    0.08*domain
    0.12*domain
    0.08*domain
    0.1*domain
    0.1*domain];
    
gap_y = 0.1*domain;

box_x = 0.08*domain;
box_xs = [box_x-box_w*0.33
    box_x-box_w*0.33
    box_x+box_w*1.33
    box_x+box_w*1.33
    box_x-box_w*0.33];

c1_x = [0.1*domain
    0.1*domain
    0.08*domain
    0.08*domain
    0.08*domain
    0.12*domain
    0.12*domain]+box_w*0.76;
c1_y = [x_base
    x_base+gap_y
    x_base+gap_y
    x_base+gap_y*11
    x_base+gap_y
    x_base+gap_y
    x_base+gap_y*11];

c2_x = [0.08*domain
    0.12*domain
    0.1*domain
    0.1*domain]+box_w*0.76;


%% 
for i=1:n
    figure(4)
    subplot(1,3,1)
    plot([box_x,box_x+box_w],[x_base,x_base],"LineWidth",2)
    axis(borders)
    hold on
    line(borders(1:2), [0, 0], "LineStyle", '--')
    if x_d(1) == x_d(2)
        line(borders(1:2), [1, 1], "Color", "red", "LineStyle", '--')
    end
    
    k1_y = [x_base
        x_base+gap_y
        x_base+gap_y
        x_base+gap_y
        x_base+gap_y+(x(1,i)-(x_base+gap_y)-box_h/2-gap_y)/3
        x_base+gap_y+(x(1,i)-(x_base+gap_y)-box_h/2-gap_y)/3
        x_base+gap_y+(x(1,i)-(x_base+gap_y)-box_h/2-gap_y)/3*2
        x_base+gap_y+(x(1,i)-(x_base+gap_y)-box_h/2-gap_y)/3*2
        x(1,i)-box_h/2-gap_y
        x(1,i)-box_h/2-gap_y
        x(1,i)-box_h/2];
    plot(k1_x, k1_y)
    
    plot(k1_x+box_w*0.38, k1_y)
    
    plot(c1_x, c1_y, 'b')
    
    c2_y = [x(1,i)-box_h/2-gap_y*11
        x(1,i)-box_h/2-gap_y*11
        x(1,i)-box_h/2-gap_y*11
        x(1,i)-box_h/2];
    
    plot(c2_x, c2_y, 'b')
    
    box_ys = [x(1,i)-box_h/2
        x(1,i)+box_h
        x(1,i)+box_h
        x(1,i)-box_h/2
        x(1,i)-box_h/2];
    plot(box_xs,box_ys,"LineWidth",2)
    hold off
    
    subplot(1,3,[2,3])
    plot(t, x_d(1,:) , '--')
    axis([t(1)-1, t(end)+2, borders(3:4)])
    hold on
    plot(t(1:i), x(1, 1:i), 'k')
    plot(t(i), x(1, i), 'ok', "MarkerSize", 8, "MarkerFaceColor", "k")
    hold off
    if i == n
        break
    end
    pause((t(i+1)-t(i))/3)
end