Category.all.each do |category|
  FactoryBot.create_list(:article, 5, :title, :with_image, category: category)
end
