function out_signal = coding_amp(message, bit_rate)

    map = cell(2,32);
    letters = 'abcdefghijklmnopqrstuvwxyz .,!?;"';
     bin_signal = '';

    for i=1:32
       map(1,i) = {letters(i)};
       map(2,i)={dec2bin(i-1,5)};
    end

     mapset = containers.Map(map(1,:), map(2,:));
   
    for j=1:length(message)
        bin_signal = strcat(bin_signal, mapset(message(j)));
    end    
   
     
    if bit_rate == 1
       
        ts = 0.01;
        t = -3:ts:30-ts;
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
        t = -3:ts:30-ts;
        u = zeros(1,length(t)) ;
        q = 1/3 * sin(2*pi*t);
        w = 2/3 * sin(2*pi*t);
        v = sin(2*pi*t);
        z = u;
        
        for i = 1:2:length(bin_signal)
            
            if strcmp(bin_signal(i:i+1), '00')
                z1 = rectpuls(t-i+2).* u;
                z = z + z1;
            elseif strcmp(bin_signal(i:i+1), '01')
                z1 = rectpuls(t-i+2).* q;
                z = z + z1;
            elseif strcmp(bin_signal(i:i+1), '10')
                z1 = rectpuls(t-i+2).* w;
                z = z + z1;
            elseif strcmp(bin_signal(i:i+1), '11')
                z1 = rectpuls(t-i+2).* v;
                z = z + z1;
            end
            
        end
        
    end
    
    if bit_rate == 3
       
        ts = 0.01;
        t = -3:ts:30-ts;
        u0 = zeros(1,length(t)) ;
        u1 = 1/7 * sin(2*pi*t);
        u2 = 2/7 * sin(2*pi*t);
        u3 = 3/7 * sin(2*pi*t);
        u4 = 4/7 * sin(2*pi*t);
        u5 = 5/7 * sin(2*pi*t);
        u6 = 6/7 * sin(2*pi*t);
        u7 = sin(2*pi*t);
        z = u0;
        
        for i = 1:3:length(bin_signal)
            
            if strcmp(bin_signal(i:i+2), '000')
                z1 = rectpuls(t-i+3).* u0;
                z = z + z1;
              
            elseif strcmp(bin_signal(i:i+2), '001')
                z1 = rectpuls(t-i+3).* u1;
                z = z + z1;
                
            elseif strcmp(bin_signal(i:i+2), '010')
                z1 = rectpuls(t-i+3).* u2;
                z = z + z1;
               
            elseif strcmp(bin_signal(i:i+2), '011')
                z1 = rectpuls(t-i+3).* u3;
                z = z + z1;
                
            elseif strcmp(bin_signal(i:i+2), '100')
                z1 = rectpuls(t-i+3).* u4;
                z = z + z1;
                disp(i)
            elseif strcmp(bin_signal(i:i+2), '101')
                z1 = rectpuls(t-i+3).* u5;
                z = z + z1;
                
            elseif strcmp(bin_signal(i:i+2), '110')
                z1 = rectpuls(t-i+3).* u6;
                z = z + z1;
                
            elseif strcmp(bin_signal(i:i+2), '111')
                z1 = rectpuls(t-i+3).* u7;
                z = z + z1;
                
            end
              
        end
       
    end
    
    out_signal = z;
end












