function decoded_bin_message = decoding_amp(signal, bit_rate)

    ts = 0.01;
    t = 0:ts:30-ts;    
    out = '';
    i = 1;
     
     if(bit_rate == 1)
        
         sig = sin(2 * pi * t);
         s = sig(51:150);
         ss = sig(1:50);
        
         while i < length(t)-50
             if(i == 1)
                 if(corr2(signal(1:50), ss) == 1)
                     out = strcat(out, '1');
                 else
                     out = strcat(out, '0');
                 end
                 i = i + 50;
             else
                 z = signal(i:i + 99);
                 if round(corr2(z, s)) == 1
                     out = strcat(out, '1');
                 else
                     out = strcat(out, '0');
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
                  if round(corr2(z,ss)) == 1
                     if floor(max(z)) == 1
                         out = strcat(out, '11');
                     elseif round(max(z),2) == 0.67
                         out = strcat(out, '10');
                     elseif round(max(z),2) == 0.33
                         out = strcat(out, '01');
                     end
                 else
                     out = strcat(out, '00');
                 end
                 i = i + 50;
                 
             else
                  
                 z = signal(i:i + 99);
                 if round(corr2(z,s)) == 1
                     if floor(max(z)) == 1
                         out = strcat(out, '11');
                     elseif round(max(z),2) == 0.67
                         out = strcat(out, '10');
                     elseif round(max(z),2) == 0.33
                         out = strcat(out, '01');
                     end
                 else
                     out = strcat(out, '00');
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
                     if floor(max(z)) == 1
                         out = strcat(out, '111');
                     elseif round(max(z),2) == 0.86
                         out = strcat(out, '110');
                     elseif round(max(z),2) == 0.71
                         out = strcat(out, '101');
                     elseif round(max(z),2) == 0.57
                         out = strcat(out, '100');
                     elseif round(max(z),2) == 0.43
                         out = strcat(out, '011');
                     elseif round(max(z),2) == 0.29
                         out = strcat(out, '010');
                     elseif round(max(z),2) == 0.14
                         out = strcat(out, '001');
                     end
                 else
                     out = strcat(out, '000');
                 end
                 i = i + 50;
                 
             else
                  
                 z = signal(i:i + 99);
                 if round(corr2(z,s)) == 1
                     if floor(max(z)) == 1
                         out = strcat(out, '111');
                     elseif round(max(z),2) == 0.86
                         out = strcat(out, '110');
                     elseif round(max(z),2) == 0.71
                         out = strcat(out, '101');
                     elseif round(max(z),2) == 0.57
                         out = strcat(out, '100');
                     elseif round(max(z),2) == 0.43
                         out = strcat(out, '011');
                     elseif round(max(z),2) == 0.29
                         out = strcat(out, '010');
                     elseif round(max(z),2) == 0.14
                         out = strcat(out, '001');
                     end
                 else
                     out = strcat(out, '000');
                 end
                i = i+100;
                
              end
         end
         
     end
     
     decoded_bin_message = out;

end




         