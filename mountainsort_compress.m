% import msutils.*

function [outc0,outc1,outf32, outf30] = mountainsort_compress(FILENAME)
addpath('/Users/erendiztarakci/documents/MountainLab/LBL/mda_helpers');
    input = readmda(FILENAME);
%   input = FILENAME;
	og_input = input;
    cname = '';
    fname = '';
%     bname = '';

    for c = 0:.1:.1
% 		linearity
%       plot each line together color coded
%       x: raw file y: non-linear file
		input = og_input-(sin(og_input))*c*og_input^2;
% 		cname = num2str(c)
        if c == 0
            outc0 = writemda16i(input,cname);
        end 
        if c == .1
            outc1 = writemda16i(input,cname);
        end
    end

    for f = 32:-2:30
%       try two steps when writing, y-vector length, x-sampling
%       rate-bar plot. fraction of og length too
% 		sampling rate
        p = 32;
        q = f;
        input = resample(og_input,p,q);
%       fname = num2str(f)
        if f == 32
            outf32 = writemda16i(input,fname);
        end
        if f == 30
            outf30 = writemda16i(input,fname);
        end
   
%       ms = writemda(input,fname, 'int16')
%       length of vector
    end 
     
    
%     fname = 'c'+ cname + '_f' + fname;
    
    
    
% 		for b = 16:-2:8
% 			//bit depth
% 			p = 16
% 			q = b
% 			% possibly treat matrix as image-numpy.astype
%           matlab hist(data, #BINS) take max val in vector and divide
%           by 2 to get 2^15 bins which becomes the step size
% 			bname = num2str(b)
%           max numerical value in vector = plot
% 				
% 			fname = 'c'+ cname + '_f' + fname + '_b' + bname;
% 			ms = writemda(input,fname, )
% 		end
		
	
end