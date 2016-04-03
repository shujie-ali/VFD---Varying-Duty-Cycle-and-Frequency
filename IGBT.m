function [ X ] = IGBT( V , tht)
%IGBT Summary of this function goes here
%   Detailed explanation goes here
%It is Insulated Gate bi polar transistor
X = V.*sind(tht);
end