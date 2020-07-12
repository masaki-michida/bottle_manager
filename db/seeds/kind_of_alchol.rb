alchol = ["吉助","バランタイン","黒霧","白"]

alchol.each do |a|
  KindOfAlchol.create(name:a)
end