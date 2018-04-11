function [R, G, B] = getColor(index, max)
H = round(360.0*double(index)/double(max));
S = 1.0;
V = 1.0;
C = V*S;
X = C*(1 - abs(mod(H/60,2)-1));
m = V-C;
if(H>=0&&H<60)
    R1 = C;
    G1 = X;
    B1 = 0;
end
if(H>=60&&H<120)
    R1 = X;
    G1 = C;
    B1 = 0;
end
if(H>=120&&H<180)
    R1 = 0;
    G1 = C;
    B1 = X;
end
if(H>=180&&H<240)
    R1 = 0;
    G1 = X;
    B1 = C;
end
if(H>=240&&H<300)
    R1 = X;
    G1 = 0;
    B1 = C;
end
if(H>=300&&H<=360)
    R1 = C;
    G1 = 0;
    B1 = X;
end
R = round((R1+m)*255);
G = round((G1+m)*255);
B = round((B1+m)*255);