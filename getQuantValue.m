function quantValue = getQuantValue(val, step)
    i=0;
    while i<255
        if val >= i && val < i+step
            quantValue=(i+(step/2));
            if quantValue>255 
                quantValue=255;
            end
        end
        i=i+step;
    end
end
