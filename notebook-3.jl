### A Pluto.jl notebook ###
# v0.19.36

using Markdown
using InteractiveUtils

# ╔═╡ 1524f257-0e9a-468d-88a6-9e4ec8dde8a3
begin
	using StatsBase # mean，median,StatsBase.modeで必要
end

# ╔═╡ 73ab09a6-88b9-11ed-2280-91c5a128a192
md"""
## データの代表値

"""

# ╔═╡ 2832ab1a-f5c1-4a67-b66f-c42b0d6c5065
data3= [19,10,18,12,16,22,17,14,12,11]

# ╔═╡ 7ee967c1-a6d6-409e-a917-b02fde3965ae
md"""
__練習3__

次のハンドボール投げの飛行距離のデータについて，その平均値を求めよ。（単位はm）

$(data3)

"""

# ╔═╡ 90891377-cd97-4aa9-953f-271a59b7f87c
function heikin(x)
	S = 0
	for i=1:length(x)
		S +=x[i]
	end
	heikin = S/length(x)
end


# ╔═╡ 60e66f0f-8ff2-4fee-bbc9-d5476b26b1d7
heikin(data3) ≈　mean(data3)

# ╔═╡ 0d62d497-5e4c-4142-be2e-f997f18e77e9
md"""
平均（ミーン）は$(mean(data3))m
"""

# ╔═╡ 5962acc3-c216-4c33-a308-cd2f5d9ccae5
data4 = [38,56,43,35,49,51,31]

# ╔═╡ 5b506ace-2dae-454e-8d53-c24abf6738a3
md"""
__練習4__

次のデータは，七人の生徒の右手の握力の測定値である。（単位はkg）

$(data4)

+ このデータの中央値を求めよ。
+ このデータに，8人目の測定値として41kgが追加された時の中央値を求めよ。

"""

# ╔═╡ c33ea238-7951-4fec-a1be-f7556fc6023f
7 % 2

# ╔═╡ b737dfef-f7d7-466a-96bd-97aa8092e312
function chuo(x)
	p = sort(x)
	n = length(p)
	if n % 2 == 0
		(p[n ÷ 2]  + p[n ÷ 2 +1] )/2
	else p[(n+1) ÷ 2] /1
	end
end

# ╔═╡ 7145a048-73bb-401e-bffd-0879371a5165
chuo(data4)

# ╔═╡ 1eaffca2-8579-4a35-afbd-cdb53f1beb52
chuo(data4) ≈ median(data4)

# ╔═╡ 91256f38-9836-458e-8a70-04a77aa22747
md"""
中央値（メジアン）は$(median(data4))kg
"""

# ╔═╡ 7aff0dd3-9463-42d2-a1eb-c0c986ef813d
data4b = [38,56,43,35,49,51,31,41]

# ╔═╡ eda87f8b-9fda-41ed-be44-bd88bcee84b4
md"""
41kgが追加された時の中央値（メジアン）は$(median(data4b))kg
"""

# ╔═╡ c5be0ef0-c6ea-4741-ad4a-e31ec0b83416
begin
data1=[
8.3
13.0
8.4
7.9
7.0
3.7
6.1
8.5
8.6
11.9
12.1
14.4
7.0
10.5
6.6
10.6
16.6
19.1
20.1
19.8
24.5
12.6
16.4
13.0
13.3
14.1
14.4
17.0
21.3
24.5] 
	md"""
	
__練習5__

下の度数分布表において，最頻値を求めよ。

__度数分布表（札幌の2018年4月の日ごとの最高気温）__


階級（℃） | 度数（日）
:------------ | :-------------:
3以上6未満 | $(count(i->(3<=i<6),data1))
6〜9 | $(count(i->(6<=i<9),data1))
9〜12 | $(count(i->(9<=i<12),data1))
12〜15 | $(count(i->(12<=i<15),data1))
15〜18 | $(count(i->(15<=i<18),data1))
18〜21 | $(count(i->(18<=i<21),data1))
21〜24 | $(count(i->(21<=i<24),data1))
24〜27 | $(count(i->(24<=i<27),data1))
27〜30 | $(count(i->(27<=i<30),data1))

"""
end

# ╔═╡ 2ab21f8e-6eb3-4517-96a2-d4952790b5d8
function saihin(y,k)
	data = map(x->floor(x/k)*k+k/2, y)
	data2 = union(data)
	A = []
	for i in data2
	 	push!(A,count(a->(a==i),data))
	end
	data2[findmax(A)[2]]
end

# ╔═╡ 09f10dd7-b218-4faa-8354-d4d487d7c77b
saihin(data1,3)

# ╔═╡ 384584fe-7179-4529-bf7d-ac18f1d5f372
saihin(data1,3) ≈ StatsBase.mode(map(x->floor(x/3)*3+1.5, data1))

# ╔═╡ d3494918-971c-40c1-84ad-1198df149577
begin
	f(x)=floor(x/3)*3+1.5 # 階級値を求める関数
	data1b = map(f, data1) # data1を階級値にする
md"""
+  札幌の最頻値は $(StatsBase.mode(data1b))℃
"""
end

# ╔═╡ fcbac9df-0ff0-4d2d-b956-90c67f8f711b
# 最頻値は一意ではない。（複数ある可能性がある。）そのうちの1つを与えるが，範囲を指定して，その中の最頻値を求めることもできる。

StatsBase.mode([1,2,3,4,4,4,3,3,2,3,2],4:5)

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
StatsBase = "2913bbd2-ae8a-5f71-8c99-4fb6c76f3a91"

[compat]
StatsBase = "~0.33.21"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.8.4"
manifest_format = "2.0"
project_hash = "03c6d11380f7521be97b6e0aae6aea6e7ee2c6d6"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[deps.ChainRulesCore]]
deps = ["Compat", "LinearAlgebra", "SparseArrays"]
git-tree-sha1 = "e7ff6cadf743c098e08fca25c91103ee4303c9bb"
uuid = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
version = "1.15.6"

[[deps.ChangesOfVariables]]
deps = ["ChainRulesCore", "LinearAlgebra", "Test"]
git-tree-sha1 = "38f7a08f19d8810338d4f5085211c7dfa5d5bdd8"
uuid = "9e997f8a-9a97-42d5-a9f1-ce6bfc15e2c0"
version = "0.1.4"

[[deps.Compat]]
deps = ["Dates", "LinearAlgebra", "UUIDs"]
git-tree-sha1 = "00a2cccc7f098ff3b66806862d275ca3db9e6e5a"
uuid = "34da2185-b29b-5c13-b0c7-acf172513d20"
version = "4.5.0"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.0.1+0"

[[deps.DataAPI]]
git-tree-sha1 = "e8119c1a33d267e16108be441a287a6981ba1630"
uuid = "9a962f9c-6df0-11e9-0e5d-c546b8b5ee8a"
version = "1.14.0"

[[deps.DataStructures]]
deps = ["Compat", "InteractiveUtils", "OrderedCollections"]
git-tree-sha1 = "d1fff3a548102f48987a52a2e0d114fa97d730f0"
uuid = "864edb3b-99cc-5e75-8d2d-829cb0a9cfe8"
version = "0.18.13"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.DocStringExtensions]]
deps = ["LibGit2"]
git-tree-sha1 = "2fb1e02f2b635d0845df5d7c167fec4dd739b00d"
uuid = "ffbed154-4ef7-542d-bbb7-c09d3a79fcae"
version = "0.9.3"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[deps.InverseFunctions]]
deps = ["Test"]
git-tree-sha1 = "49510dfcb407e572524ba94aeae2fced1f3feb0f"
uuid = "3587e190-3f89-42d0-90ee-14403ec27112"
version = "0.1.8"

[[deps.IrrationalConstants]]
git-tree-sha1 = "7fd44fd4ff43fc60815f8e764c0f352b83c49151"
uuid = "92d709cd-6900-40b7-9082-c6be49f344b6"
version = "0.1.1"

[[deps.LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.LinearAlgebra]]
deps = ["Libdl", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.LogExpFunctions]]
deps = ["ChainRulesCore", "ChangesOfVariables", "DocStringExtensions", "InverseFunctions", "IrrationalConstants", "LinearAlgebra"]
git-tree-sha1 = "946607f84feb96220f480e0422d3484c49c00239"
uuid = "2ab3a3ac-af41-5b50-aa03-7779005ae688"
version = "0.3.19"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[deps.Missings]]
deps = ["DataAPI"]
git-tree-sha1 = "f66bdc5de519e8f8ae43bdc598782d35a25b1272"
uuid = "e1d29d7a-bbdc-5cf2-9ac0-f12de2c33e28"
version = "1.1.0"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"
version = "1.2.0"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.20+0"

[[deps.OrderedCollections]]
git-tree-sha1 = "85f8e6578bf1f9ee0d11e7bb1b1456435479d47c"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.4.1"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.SortingAlgorithms]]
deps = ["DataStructures"]
git-tree-sha1 = "a4ada03f999bd01b3a25dcaa30b2d929fe537e00"
uuid = "a2af1166-a08f-5f64-846c-94a0d3cef48c"
version = "1.1.0"

[[deps.SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[deps.StatsAPI]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "f9af7f195fb13589dd2e2d57fdb401717d2eb1f6"
uuid = "82ae8749-77ed-4fe6-ae5f-f523153014b0"
version = "1.5.0"

[[deps.StatsBase]]
deps = ["DataAPI", "DataStructures", "LinearAlgebra", "LogExpFunctions", "Missings", "Printf", "Random", "SortingAlgorithms", "SparseArrays", "Statistics", "StatsAPI"]
git-tree-sha1 = "d1bf48bfcc554a3761a133fe3a9bb01488e06916"
uuid = "2913bbd2-ae8a-5f71-8c99-4fb6c76f3a91"
version = "0.33.21"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl", "OpenBLAS_jll"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.1.1+0"
"""

# ╔═╡ Cell order:
# ╠═73ab09a6-88b9-11ed-2280-91c5a128a192
# ╠═1524f257-0e9a-468d-88a6-9e4ec8dde8a3
# ╠═7ee967c1-a6d6-409e-a917-b02fde3965ae
# ╠═2832ab1a-f5c1-4a67-b66f-c42b0d6c5065
# ╠═90891377-cd97-4aa9-953f-271a59b7f87c
# ╠═60e66f0f-8ff2-4fee-bbc9-d5476b26b1d7
# ╠═0d62d497-5e4c-4142-be2e-f997f18e77e9
# ╠═5b506ace-2dae-454e-8d53-c24abf6738a3
# ╠═5962acc3-c216-4c33-a308-cd2f5d9ccae5
# ╠═c33ea238-7951-4fec-a1be-f7556fc6023f
# ╠═b737dfef-f7d7-466a-96bd-97aa8092e312
# ╠═7145a048-73bb-401e-bffd-0879371a5165
# ╠═1eaffca2-8579-4a35-afbd-cdb53f1beb52
# ╠═91256f38-9836-458e-8a70-04a77aa22747
# ╠═7aff0dd3-9463-42d2-a1eb-c0c986ef813d
# ╠═eda87f8b-9fda-41ed-be44-bd88bcee84b4
# ╠═c5be0ef0-c6ea-4741-ad4a-e31ec0b83416
# ╠═2ab21f8e-6eb3-4517-96a2-d4952790b5d8
# ╠═09f10dd7-b218-4faa-8354-d4d487d7c77b
# ╠═384584fe-7179-4529-bf7d-ac18f1d5f372
# ╠═d3494918-971c-40c1-84ad-1198df149577
# ╠═fcbac9df-0ff0-4d2d-b956-90c67f8f711b
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
