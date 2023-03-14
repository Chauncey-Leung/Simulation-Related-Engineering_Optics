function result = Ep_wave(x,y,r)
    result = 0;
    if(x.^2 + y.^2 <= r)
        result = 1;
    end
end