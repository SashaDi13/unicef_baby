FactoryBot.create(:category, :helth)
FactoryBot.create(:category, :feed)
FactoryBot.create(:category, :secure)
FactoryBot.create(:category, :add)
FactoryBot.create(:category, :emergency)

FactoryBot.create(:admin)
FactoryBot.create(:admin, email: "olecsandra.di@gmail.com") # DELETE BEFORE ADD TO GIT!!!!!!!!!

Category.all.each do |category|
  FactoryBot.create_list(:article, 8, category: category)
end
