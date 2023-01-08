function decoded_message = newdecoding(signal, bit_rate)

    ts = 0.01;
    t = 0:ts:30-ts;    
    bin_out = '';
    i = 1;
    load MAP
    out = '';
    mapset = containers.Map(MAP(2,:), MAP(1,:));
    
     if(bit_rate == 1)
        
         sig = sin(2 * pi * t);
         s = sig(51:150);
         ss = sig(1:50);
        
         while i < length(t)-50
             if(i == 1)
                
                 if(round(corr2(signal(1:50), ss)))
                     bin_out = strcat(bin_out, '1');
                 else
                     bin_out = strcat(bin_out, '0');
                 end
                 i = i + 50;
             else
                 z = signal(i:i + 99);
                   
                 if round(corr2(z, s)) == 1
                     bin_out = strcat(bin_out, '1');
                 else
                     bin_out = strcat(bin_out, '0');
                 end
                 i = i + 100;
             end
             
         end
        
     elseif(bit_rate == 2)
         
        sig = sin(2 * pi * t);
        s = sig(51:150);
        ss = sig(1:50);
        
         while i < length(t)/2 - 49
             
             if(i == 1)
                  
                 z = signal(i:i + 49);
                 disp(corr2(z, ss))
                 amp = round(max(abs(z)),2);
                 if round(corr2(z,ss)) == 1
                     if  amp <= 1 && amp > 5/6
                         bin_out = strcat(bin_out, '11');
                     elseif amp <= 5/6 && amp > 3/6
                         bin_out = strcat(bin_out, '10');
                     elseif amp <= 3/6 && amp > 1/6
                         bin_out = strcat(bin_out, '01');
                     else
                         bin_out = strcat(bin_out, '00');
                     end
                 else
                     bin_out = strcat(bin_out, '00');
                 end
                 i = i + 50;
                 
             else
                  
                 z = signal(i:i + 99);
                 disp(corr2(z, s))
                 amp = round(max(abs(z)),2);
                 if round(corr2(z,s)) == 1
                     if  amp <= 1 && amp > 5/6
                         bin_out = strcat(bin_out, '11');
                     elseif amp <= 5/6 && amp > 3/6
                         bin_out = strcat(bin_out, '10');
                     elseif amp <= 3/6 && amp > 1/6
                         bin_out = strcat(bin_out, '01');
                     else
                         bin_out = strcat(bin_out, '00');
                     end
                 else
                     bin_out = strcat(bin_out, '00');
                 end
                i = i+100;
                
              end
         end
         
     elseif(bit_rate == 3)
         
         sig = sin(2 * pi * t);
         s = sig(51:150);
         ss = sig(1:50);
        
         while i < length(t)/3 - 49
             
             if(i == 1)

                 z = signal(i:i + 49);
                  if round(corr2(z,ss)) == 1
                     if round(max(z), 2) == 1
                         bin_out = strcat(bin_out, '111');
                     elseif round(max(z),2) == 0.86
                         bin_out = strcat(bin_out, '110');
                     elseif round(max(z),2) == 0.71
                         bin_out = strcat(bin_out, '101');
                     elseif round(max(z),2) == 0.57
                         bin_out = strcat(bin_out, '100');
                     elseif round(max(z),2) == 0.43
                         bin_out = strcat(bin_out, '011');
                     elseif round(max(z),2) == 0.29
                         bin_out = strcat(bin_out, '010');
                     elseif round(max(z),2) == 0.14
                         bin_out = strcat(bin_out, '001');
                     end
                 else
                     bin_out = strcat(bin_out, '000');
                 end
                 i = i + 50;
                 
             else
                  
                 z = signal(i:i + 99);
                 if round(corr2(z,s)) == 1
                     if round(max(z),2) == 1
                         bin_out = strcat(bin_out, '111');
                     elseif round(max(z),2) == 0.86
                         bin_out = strcat(bin_out, '110');
                     elseif round(max(z),2) == 0.71
                         bin_out = strcat(bin_out, '101');
                     elseif round(max(z),2) == 0.57
                         bin_out = strcat(bin_out, '100');
                     elseif round(max(z),2) == 0.43
                         bin_out = strcat(bin_out, '011');
                     elseif round(max(z),2) == 0.29
                         bin_out = strcat(bin_out, '010');
                     elseif round(max(z),2) == 0.14
                         bin_out = strcat(bin_out, '001');
                     end
                 else
                     bin_out = strcat(bin_out, '000');
                 end
                i = i+100;
                
              end
         end
         
     end
     
    %Decode BIN string to message
    disp(bin_out)
    for k = 1:5:length(bin_out)
       out = strcat(out, mapset(bin_out(k:k+4)));
    end
    
    decoded_message = out;

end




         