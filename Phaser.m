function [ V ] = Phaser( Vmax,f,t,Phase )
%VOLTAGE Summary of this function goes here
%   Detailed explanation goes here 
V = Vmax.*sin((2.*pi.*f.*t)+Phase);
end

