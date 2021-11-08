FactoryBot.create(:category, :helth)
FactoryBot.create(:category, :feed)
FactoryBot.create(:category, :secure)
FactoryBot.create(:category, :add)
FactoryBot.create(:category, :emergency)


Category.all.each do |category|
  FactoryBot.create_list(:article, 8, category: category)
end
