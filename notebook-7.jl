### A Pluto.jl notebook ###
# v0.19.36

using Markdown
using InteractiveUtils

# ╔═╡ 27378554-891d-11ed-131b-3beb04a4f41c
md"""
## 仮説検定の考え方

"""

# ╔═╡ 11142870-9773-416b-84ea-c73e90c568bd
md"""
__練習16__

ある地域の水道局が，水道水の品質改善に取り組んでいる。

無作為に選んだ地域の住民20人に以前に比べて水道水がおいしくおなったと感じるか回答してもらったとこr，15人が以前より美味しくなったと回答した。

この回答データから，以前に比べて水道水がおいしくなったと住民から評価されていると判断してよいか。仮説検定の考え方を用いて，基準となる確率を0.05として考察せよ。

ただし，公正なコインを20回投げて表の出た回数を記録する実験を200セット行なったところ次の表のようになったとし，この結果を用いよ。

	"""

# ╔═╡ 8a44ee77-ff3f-40f5-9f36-0aa0d6dbc730
omote = Vector(5:17)

# ╔═╡ 99c0f56a-6b3d-4b1c-bfe5-2c0f2d10d175
dosu = [1,7,23,20,30,35,35,18,20,7,3,0,1]

# ╔═╡ ec17fc4b-6690-46a5-8317-2e005947016d
function kentei(x,l,m)
	kakuritu = 0
	for i=l:m
		kakuritu += x[i]/200
	end
	println("確率は$(kakuritu) である")
	if kakuritu < 0.05
		println("水道水がおいしくなったと判断できる。")
	else println("水道水がおいしくなったと判断できない。")
	end
end

# ╔═╡ bb303836-ed10-4033-be39-8591839751ef
kentei(dosu,11,13)#片側検定である。

# ╔═╡ bbd60aa2-d7c2-46e7-bffa-1bd2ec21c997
# 裏が15回以上と考えると，
kentei(dosu,1,1)

# ╔═╡ c22effdb-360b-42d4-a589-03061a6b913e
md"""

__仮説検定と反復試行の確率__

__練習1__

1枚のコインを6回投げたところ，表が5回でた。このコインは表が出やすいと判断してよいか。仮設検定の考え方を用い，基準となる確率を0.05として考察せよ。

"""

# ╔═╡ f3e649a4-baba-4c39-9b36-ce5e89db0a92
function kentei2(k,n)
	kakuritu = 0
	for i=k:n
		kakuritu += binomial(n,i)*.5^n
	end
	println("確率は$(kakuritu) である")
	if kakuritu < 0.05
		println("このコインは出やすいと判断できる。")
	else println("このコインは出やすいと判断できない。")
	end
end

# ╔═╡ e647948f-7c7b-43ab-8238-3dae9c7b9be4
kentei2(5,6)

# ╔═╡ 2f2b05d6-aa09-4d16-ad78-881f3c56a8fc
kentei2(9,10)#もし，10回中9回表だったら？

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.8.5"
manifest_format = "2.0"
project_hash = "da39a3ee5e6b4b0d3255bfef95601890afd80709"

[deps]
"""

# ╔═╡ Cell order:
# ╠═27378554-891d-11ed-131b-3beb04a4f41c
# ╠═11142870-9773-416b-84ea-c73e90c568bd
# ╠═8a44ee77-ff3f-40f5-9f36-0aa0d6dbc730
# ╠═99c0f56a-6b3d-4b1c-bfe5-2c0f2d10d175
# ╠═ec17fc4b-6690-46a5-8317-2e005947016d
# ╠═bb303836-ed10-4033-be39-8591839751ef
# ╠═bbd60aa2-d7c2-46e7-bffa-1bd2ec21c997
# ╠═c22effdb-360b-42d4-a589-03061a6b913e
# ╠═f3e649a4-baba-4c39-9b36-ce5e89db0a92
# ╠═e647948f-7c7b-43ab-8238-3dae9c7b9be4
# ╠═2f2b05d6-aa09-4d16-ad78-881f3c56a8fc
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
