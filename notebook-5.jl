### A Pluto.jl notebook ###
# v0.19.36

using Markdown
using InteractiveUtils

# ╔═╡ 1f7f9acc-f66f-4277-b6ff-2147a5a571ea
begin
	using Statistics
end

# ╔═╡ b0a7d50e-88f6-11ed-147e-df1695233b61
md"""
## 分散と標準偏差

"""

# ╔═╡ 9abcc5b4-4ec6-46e1-898a-2f1c5809c4e0
data10 = [6,10,7,7,5,4,9,10,5,7]

# ╔═╡ 575f5632-e142-4a27-ade9-fd3cc13c2190
md"""
__練習10__

次のデータは，10人の生徒に計算テストを行なった結果である。このデータの分散$\sigma^2$，標準偏差$\sigma$を求めよ。

$(data10)

	"""

# ╔═╡ c09ac490-07aa-4c59-bcb3-18e6df4915a1
function bunsan(x)
	μ = mean(x)
	n = length(x)
	v = 0
	for i =1:n
		v += (x[i]-μ)^2/n
	end
	v
end		

# ╔═╡ fc3b6d21-e7d2-443f-b29e-76988754e063
bunsan(data10) 

# ╔═╡ 7843afd2-a6d3-4baf-95ea-c1c695137f2f
bunsan(data10) ≈ var(data10, corrected=false)

# ╔═╡ 1c51669f-b984-4465-ad96-e37e54e8f1f0
√(bunsan(data10)) ≈ std(data10, corrected=false)

# ╔═╡ cb53b3a0-6d88-4dc4-9c4c-7809e83ab944
√(bunsan(data10))

# ╔═╡ a325abe9-340b-4512-b7ba-cfb35247d4b6
var(data10, corrected=false) #corrected=trueは不偏分散

# ╔═╡ 3416e3ca-57a8-43bf-b91c-03466aa48e5f
std(data10, corrected=false) #corrected=trueは不偏標準偏差

# ╔═╡ 85c5b709-5d26-46ea-8f92-5006c7fef711
md"""

+ 分散は$(var(data10, corrected=false)) 

+ 標準偏差は$(std(data10, corrected=false)) 

"""

# ╔═╡ 57145b76-e4a3-448e-b79a-948ed8844ffa
data8a = [1,1,2,2,3,3,3,4,4,5,5,5,6,6,7,7,8,9,9,10]

# ╔═╡ fc545017-b89c-4fad-ae9d-fc100b8686c9
data8b = [3,3,3,4,4,4,5,5,5,5,5,5,5,6,6,6,6,6,7,7]

# ╔═╡ 0d712c65-765e-4802-a7fb-2e49f0bf53f7
data8c = [1,2,3,3,4,4,4,4,5,5,5,5,5,6,6,6,7,7,8,10]

# ╔═╡ 182d377f-31a7-4cb9-8c0d-64d6222f68e0
 md"""
__練習11（問1なども含む）__

次のテストのデータA，B，Cの分散と標準偏差を求めよ。

+ テストA

+ $(data8a) 


+ テストB

+ $(data8b) 


+ テストC

+ $(data8c) 

"""
 

# ╔═╡ 033cea53-55b9-48ba-b112-5cde46958ec3
md"""



| | テストA | テストB | テストC |
|:---:|:---:|:---:|:---:|
|分散 |$(var(data8a,corrected=false))|$(var(data8b,corrected=false))|$(var(data8c,corrected=false))|
|分標準偏差|$(std(data8a,corrected=false))|$(std(data8b,corrected=false))|$(std(data8c,corrected=false))|



"""

# ╔═╡ cabaaabd-e2d1-4cdd-8269-85aa624e5f8c
md"""
__変量の変換__

__練習1__

ある都市の日ごとの最高気温を摂氏度（℃）で計測し，20日分のデータを得た。その平均値は15.0℃，分散は9.0であった。このデータを華氏度（℉）に変更したときの，平均値，分散，標準偏差を求めよ。

ただし，摂氏度 $x$ ℃のときの華氏度 $y$ ℉とすると， $x$ と $y$ には次の関係がある。

$y=1.8x+32$

"""

# ╔═╡ af9df363-a91a-44bb-a9a4-0ec60a1e9a0d
μ = 15.0

# ╔═╡ ab41091d-531d-4e6e-bca0-ca399d45fc38
σ = √(9.0)

# ╔═╡ 65d81215-a203-4f62-b3cc-a3457ae4aa13
md"""

+ データを華氏度（℉）に変更したときの平均値は $(1.8*μ+32)


+ データを華氏度（℉）に変更したときの分散は $(1.8^2*σ^2)


+ データを華氏度（℉）に変更したときの分散は $(1.8*σ)


"""

# ╔═╡ c804c361-8ee8-4c2a-aa14-12227ccb7379
md"""

__練習2__

変量 $x$ のデータが次のように与えられている。

+ 750,740,720,770,750,740

いま，$c=10$，$x_0=740$，$u=\dfrac{x-x_0}c$ として新たな変量 $u$ を作る。

+ 変量 $u$ のデータの平均値と標準偏差を求めよ。

+ 変量 $x$ のデータの平均値と標準偏差を求めよ。

"""

# ╔═╡ 654458dc-b798-45a2-9ccd-dd250438fdbe
data02 = [750,740,720,770,750,740]

# ╔═╡ b2d5ec15-8f7b-418c-9621-21bf98bed0b2
x = data02

# ╔═╡ cf5128b6-f06d-4be0-af49-8d676f85ad68
c = 10

# ╔═╡ 2bb16583-88bd-4206-bc93-5c5a3eda6380
x₀ = 740

# ╔═╡ e6020dd0-dc2e-40e0-9ab2-d030f8a32039
u = map(x->(x-x₀)/c,x)

# ╔═╡ 22ebe9db-a283-4eac-8c07-8565c6832602
md"""

+  $u$ の平均値は $(mean(u))


+  $u$ の標準偏差は $(std(u,corrected=false))


"""

# ╔═╡ d3436ef9-286e-45db-96c3-5f15a3a73ac8
md"""

+  $x$ の平均値は $(mean(u)*c+x₀)


+  $x$ の標準偏差は $(std(u,corrected=false)*abs(c))


"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
Statistics = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.8.4"
manifest_format = "2.0"
project_hash = "c2ebf593fb8fca52e25f227c4ea4799a3b858e2f"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.0.1+0"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.LinearAlgebra]]
deps = ["Libdl", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.20+0"

[[deps.Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl", "OpenBLAS_jll"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.1.1+0"
"""

# ╔═╡ Cell order:
# ╠═b0a7d50e-88f6-11ed-147e-df1695233b61
# ╠═1f7f9acc-f66f-4277-b6ff-2147a5a571ea
# ╠═575f5632-e142-4a27-ade9-fd3cc13c2190
# ╠═9abcc5b4-4ec6-46e1-898a-2f1c5809c4e0
# ╠═c09ac490-07aa-4c59-bcb3-18e6df4915a1
# ╠═fc3b6d21-e7d2-443f-b29e-76988754e063
# ╠═7843afd2-a6d3-4baf-95ea-c1c695137f2f
# ╠═1c51669f-b984-4465-ad96-e37e54e8f1f0
# ╠═cb53b3a0-6d88-4dc4-9c4c-7809e83ab944
# ╠═a325abe9-340b-4512-b7ba-cfb35247d4b6
# ╠═3416e3ca-57a8-43bf-b91c-03466aa48e5f
# ╠═85c5b709-5d26-46ea-8f92-5006c7fef711
# ╠═182d377f-31a7-4cb9-8c0d-64d6222f68e0
# ╠═57145b76-e4a3-448e-b79a-948ed8844ffa
# ╠═fc545017-b89c-4fad-ae9d-fc100b8686c9
# ╠═0d712c65-765e-4802-a7fb-2e49f0bf53f7
# ╠═033cea53-55b9-48ba-b112-5cde46958ec3
# ╠═cabaaabd-e2d1-4cdd-8269-85aa624e5f8c
# ╠═af9df363-a91a-44bb-a9a4-0ec60a1e9a0d
# ╠═ab41091d-531d-4e6e-bca0-ca399d45fc38
# ╠═65d81215-a203-4f62-b3cc-a3457ae4aa13
# ╠═c804c361-8ee8-4c2a-aa14-12227ccb7379
# ╠═654458dc-b798-45a2-9ccd-dd250438fdbe
# ╠═b2d5ec15-8f7b-418c-9621-21bf98bed0b2
# ╠═cf5128b6-f06d-4be0-af49-8d676f85ad68
# ╠═2bb16583-88bd-4206-bc93-5c5a3eda6380
# ╠═e6020dd0-dc2e-40e0-9ab2-d030f8a32039
# ╠═22ebe9db-a283-4eac-8c07-8565c6832602
# ╠═d3436ef9-286e-45db-96c3-5f15a3a73ac8
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
