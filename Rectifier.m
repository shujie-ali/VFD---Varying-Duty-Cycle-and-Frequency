function [ V1 ] = Rectifier(V)
%RECTIFY Summary of this function goes here
%   Detailed explanation goes here
if V > 0
   V1 = V ;
elseif V <= 0;
    V1 = 0;
end
end

