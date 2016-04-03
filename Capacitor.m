function [ V, ripple ] = Capacitor( V,ripple )
%CAPACITOR Summary of this function goes here
%   Detailed explanation goes here
if V < ripple;
    diff = ripple - V;
    V = V + diff;
end
ripple = V;
end

