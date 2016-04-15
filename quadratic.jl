#using Winston

#make c = to something from command
Q(x)=x^2+c
x = 0
a = Array{Float64}(1000)
b = c*ones(1000)
for i in 1:1000
    x = Q(x)
    print(x)
    print('\n')
    a[i]=x
end
#scatter(b[101:1000],a[101:1000], 0.1)

#first time run:
#bigarray1=b[101:1000]
#bigarray2 =a[101:1000]
append!(bigarray1,b[101:1000])
append!(bigarray2,a[101:1000])
scatter(bigarray1, bigarray2, 0.05)