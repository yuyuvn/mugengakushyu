Category.delete_all
    
category_lists = [
                  {
                     "name" => "jlpt5" ,
                     "description" => "Kanji N5"
                  },
                  {
                     "name" => "jlpt4" ,
                     "description" => "Kanji N4"
                  },
                  {
                     "name" => "jlpt3" ,
                     "description" => "Kanji N3"
                  },
                  {
                     "name" => "jlpt2" ,
                     "description" => "Kanji N2"
                  },
                  {
                     "name" => "jlpt1" ,
                     "description" => "Kanji N1"
                  },
               ]
               
category_lists.each_with_index do |category, index|
   Category.seed do |s|
      s.id = index + 1
      s.name = category["name"]
      s.description = category["description"]
   end
end	
	