require "date"
s1 = Date.parse("1940/08/07")
s2 = Date.parse("2000/04/12")

name=["ウボ","リｭイケワル","ゾギョケムス","ヨニャゾドー","ガイダー","ドシェロ","パイェキュレギ","パハー","ネナドン","ゾヒザゴ","ザンブーフ","シェゲガー","ギホーパー","コヴィツァモラー","スヴシダー","タドンド","リｭソン","ビュス","バペチスト","ゼルード","ゾスト","ツルース","ヌッラツロス","チョジュジチョッド","ポオデック","ターヒレアン","エゲクス","ドード","ヨート","ピヌンビル","パヤー","プリョガンヒ"]
local_number=0

alchol = ["吉助","バランタイン","黒霧","白"]


alchol.each do |a|
  KindOfAlchol.create(name:a)
end

name.each do |n|
  local_number+=1
  birthday = Random.rand(s1 .. s2)
  karaoke_customer=Random.rand(500..5000)
  status=Random.rand(1..100)
  Customer.create(local_number:local_number,name:n,karaoke_customer:karaoke_customer,status:status,birthday:birthday)
end

10.times do |i|
  i+=1
  a = Random.rand(1..4)
  b = Random.rand(1..100)
  c = Random.rand(200..1000)
  d = Random.rand(500..5000)
  Bottle.create(local_number:i,kind_of_alchol_id:a,liquid_level:c,karaoke:d,status:b)
end

nickname = []

50.times do |n|
  n = Faker::Name.name
  nickname<<n
end

nickname.each_with_index do |n,i|
  i+=1
  Nickname.create(name:n,customer_id:i)
  if i===32
    i=1
  end
end

group = []
5.times do |g|
  g = Faker::Team.name
  group << g
end

group.each do |g|
  Group.create(name:g)
end