function out_signal = coding_amp(message, bit_rate)

    load MAP
    bin_signal = '';
    mapset = containers.Map(MAP(1,:), MAP(2,:));
    
    for j=1:length(message)
        bin_signal = strcat(bin_signal, mapset(message(j)));
    end    
   disp(bin_signal);
     
    if bit_rate == 1
       
        ts = 0.01;
        t = 0:ts:30-ts;
        u = zeros(1,length(t)) ;
        v = sin(2*pi*t);
        z = u;
        
        for i = 1:length(bin_signal)
            
            if bin_signal(i) == '0'
                z1 = rectpuls(t-i+1).* u;
                z = z + z1;
            elseif bin_signal(i) == '1'
                z1 = rectpuls(t-i+1).* v;
                z = z + z1;
            end
            
        end
          
    end
    
    if bit_rate == 2
       
        ts = 0.01;
        t = 0:ts:30-ts;
        u = zeros(1,length(t)) ;
        q = 1/3 * sin(2*pi*t);
        w = 2/3 * sin(2*pi*t);
        v = sin(2*pi*t);
        z = u;
        
        for i = 1:length(bin_signal)/2
            
            if strcmp(bin_signal(2*i-1:2*i), '00')
                z1 = rectpuls(t-i+1).* u;
                z = z + z1;
            elseif strcmp(bin_signal(2*i-1:2*i), '01')
                z1 = rectpuls(t-i+1).* q;
                z = z + z1;
            elseif strcmp(bin_signal(2*i-1:2*i), '10')
                z1 = rectpuls(t-i+1).* w;
                z = z + z1;
            elseif strcmp(bin_signal(2*i-1:2*i), '11')
                z1 = rectpuls(t-i+1).* v;
                z = z + z1;
            end
            
        end
        
    end
    
    if bit_rate == 3
       
        ts = 0.01;
        t = 0:ts:30-ts;
        u0 = zeros(1,length(t)) ;
        u1 = 1/7 * sin(2*pi*t);
        u2 = 2/7 * sin(2*pi*t);
        u3 = 3/7 * sin(2*pi*t);
        u4 = 4/7 * sin(2*pi*t);
        u5 = 5/7 * sin(2*pi*t);
        u6 = 6/7 * sin(2*pi*t);
        u7 = sin(2*pi*t);
        z = u0;
        
        for i = 1:length(bin_signal)/3
            
            if strcmp(bin_signal(3*i-2:3*i), '000')
                z1 = rectpuls(t-i+1).* u0;
                z = z + z1;
              
            elseif strcmp(bin_signal(3*i-2:3*i), '001')
                z1 = rectpuls(t-i+1).* u1;
                z = z + z1;
                
            elseif strcmp(bin_signal(3*i-2:3*i), '010')
                z1 = rectpuls(t-i+1).* u2;
                z = z + z1;
               
            elseif strcmp(bin_signal(3*i-2:3*i), '011')
                z1 = rectpuls(t-i+1).* u3;
                z = z + z1;
                
            elseif strcmp(bin_signal(3*i-2:3*i), '100')
                z1 = rectpuls(t-i+1).* u4;
                z = z + z1;
              
            elseif strcmp(bin_signal(3*i-2:3*i), '101')
                z1 = rectpuls(t-i+1).* u5;
                z = z + z1;
                
            elseif strcmp(bin_signal(3*i-2:3*i), '110')
                z1 = rectpuls(t-i+1).* u6;
                z = z + z1;
                
            elseif strcmp(bin_signal(3*i-2:3*i), '111')
                z1 = rectpuls(t-i+1).* u7;
                z = z + z1;
                
            end
              
        end
       
    end
    
    out_signal = z;
end












