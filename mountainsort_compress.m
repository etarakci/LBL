import msutils.*
function ms = msCompress(FILENAME)
	input = readmda(FILENAME)
	og_input = input

	y = null
	cname = ''
	fname = ''
	bname = ''

	for c = 0:.5:1
		//linearity
		input = og_input-(sin(og_input))*c*og_input^2
		cname = num2str(c)

		for f = 32:-2:10
			//sampling rate
			p = 32
			q = f
			y = resample(input,p,q)
			fname = num2str(f)

			for b = 16:-2:8
				//bit depth
				p = 16
				q = b
				% possibly treat matrix as image-numpy.astype
				bname = num2str(b) 
				
				fname = 'c'+ cname + '_f' + fname + '_b' + bname;
				ms = writemda(input,fname, )
			end
		end
	end
end