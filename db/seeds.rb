Category.all.each do |category|
  FactoryBot.create_list(:article, 8, :title, :with_image, category: category)
end
