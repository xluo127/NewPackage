using MyPkg0
using Test

@testset "MyPkg0.jl" begin
    @test isequal(sog(), nothing)
    @test isequal(sog([]), nothing)
    @test isequal(sog(['o']), Bool[1])
    @test isequal(sog(["one"]), Bool[1])
    @test isequal(sog(["one", "two", "one", "one", "two"]), Bool[1, 1, 1, 0, 1])
    #Random.seed!(127)
    #@test isequal(sog(rand(1:10, 20)), Bool[1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1])
    @test isequal(sog([2, 1, 2, 4, 3, 5, 5, 8, 10, 10, 4, 3, 3, 6, 1, 10, 7, 5, 5, 6]), Bool[1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1])
    #What are in rand() should be [2, 1, 2, 4, 3, 5, 5, 8, 10, 10, 4, 3, 3, 6, 1, 10, 7, 5, 5, 6] under this certain seed.
    @test isequal(sog([missing, missing, missing]), Bool[1, 0, 0])
    @test isequal(sog([missing, 1, missing, missing, 1, 1]), Bool[1, 1, 1, 0, 1, 0])
    @test isequal(sog(["a", "a", "a", 'a']), Bool[1, 0, 0, 1])
    @test isequal(sog([1, 1.0, 1.00000]), Bool[1, 0, 0])
    @test isequal(sog([Inf, Inf32, Inf64]), Bool[1, 0, 0])
end
