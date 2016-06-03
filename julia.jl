
# the julia iteration function
function julia(z, maxiter::Int64)
    c=-.801+0.256im
    for n = 1:maxiter
        if abs(z) > 2
            return n-1
        end
        z = z^2 + c
    end
    return maxiter
end

ITER = 60
function ismandel(z::Complex128)
    c = z
    for n = 1:ITER
        if abs2(z) > 4
            return false
        end
        z = z^2 + c
    end
    return true
end




function myppmwrite(img, file::String)
    s = open(file, "w")
    write(s, "P6\n")    
    n, m = size(img)
    write(s, "$m $n 255\n")
    for i=1:n, j=1:m
        p = img[i,j]
        write(s, uint8(p))
        write(s, uint8(p))
        write(s, uint8(p))
    end
    close(s)
end

delta = 0.0001
function attractingperiod(c::Complex128, period::Int64)
	h = 20
	w = 20
	for y=1:h, x=1:w
    		z = complex((x-w/2)/(h/2), (y-h/2)/(h/2))
			for n = 1:ITER
				z = z^2+c
			end
		z_0 = copy(z)
		for n=1:period
			z=z^2+c
		end
		if abs2(z_0-z)<delta
			return true
		end
	end
	return false
end
	

  
# create an Array for our picture
h = 200
w = 400
m = Array(Int64, h, w)
  

# time measurements
print("starting...\n")
tStart=time()
  
# for every pixel
count = 1
lx=Array(Float64,h*w)

ly=Array(Float64,h*w)

lcolor = Array(Int64,h*w)
for y=1:h, x=1:w
    # translate numbers [1:w, 1:h] -> -2:2 + -1:1 im
    c = complex((x-w/2)/(h/2), (y-h/2)/(h/2))
    # call our julia function
    #m[y,x] = 10*julia(c, 60)
    #m[y,x] = 200*ismandel(c)
    m[y,x]=100*attractingperiod(c, 15)
    
end
#plot(lx,ly,color=lcolor)
#show()
  
tStop = time()
print("done. took ", tStop-tStart, " seconds\n");
  
# write the ppm-file
myppmwrite(m, "julia.ppm")
  


