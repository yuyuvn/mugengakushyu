
Kanji.delete_all
Result.delete_all
Word.delete_all
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
          s.id    = index+1
          s.name = category["name"]
          s.description = category["description"]
        end
    end
    
    kanji_lists = [
                        {
                           "text" => "伺" ,
                           "mean" => "pay respects" ,
                           "other_mean" => "" ,
                           "kun" => "シ, shi" ,
                           "on" => "うかが-う, ukaga-u" ,
                           "category_id" => 1
                        },
                         {
                           "text" => "歴" ,
                           "mean" => "curriculum" ,
                           "other_mean" => "" ,
                           "kun" => "レキ, reki" ,
                           "on" => "" ,
                           "category_id" => 1
                        },
                        {
                           "text" => "網" ,
                           "mean" => "netting" ,
                           "other_mean" => "" ,
                           "kun" => "モウ, mō" ,
                           "on" => "あみ, ami" ,
                           "category_id" => 1
                        },
                          {
                           "text" => "甲" ,
                           "mean" => "armor" ,
                           "other_mean" => "" ,
                           "kun" => "コウ、カン, kō, kan" ,
                           "on" => "" ,
                           "category_id" => 1
                        },
                          {
                           "text" => "浮" ,
                           "mean" => "floating" ,
                           "other_mean" => "" ,
                           "kun" => "フ, fu" ,
                           "on" => "う-く、う-かれる、う-かぶ、う-かべる, u-ku, u-kareru, u-kabu, u-kaberu" ,
                           "category_id" => 1
                        },
                          {
                           "text" => "陰" ,
                           "mean" => "shade" ,
                           "other_mean" => "" ,
                           "kun" => "イン, in" ,
                           "on" => "かげ、かげ-る, kage, kage-ru" ,
                           "category_id" => 1
                        },
                        
                            {
                           "text" => "情" ,
                           "mean" => "feelings" ,
                           "other_mean" => "" ,
                           "kun" => "ジョウ、セイ, jō, sei" ,
                           "on" => "なさ-け, nasa-ke" ,
                           "category_id" => 1
                        },
                            {
                           "text" => "銅" ,
                           "mean" => "copper" ,
                           "other_mean" => "" ,
                           "kun" => "ドウ, dō" ,
                           "on" => "" ,
                           "category_id" => 1
                        },
                         {
                           "text" => "大" ,
                           "mean" => "large" ,
                           "other_mean" => "" ,
                           "kun" => "ダイ、タイ, dai, tai" ,
                           "on" => "おお、おお-きい、おお-いに, ō, ō-kii, ō-ini" ,
                           "category_id" => 1
                        },
                          {
                          "text" => "励" ,
                          "mean" => "encourage" ,
                          "other_mean" => "" ,
                          "kun" => "レイ, rei" ,
                          "on" => "はげ-む、はげ-ます, hage-mu, hage-masu",
                           "category_id" => 1
                        },
                           {
                          "text" => "略" ,
                          "mean" => "abbreviation" ,
                          "other_mean" => "" ,
                          "kun" => "リャク, ryaku" ,
                          "on" => "" ,
                           "category_id" => 1
                        },
                           {
                          "text" => "館" ,
                          "mean" => "public building" ,
                          "other_mean" => "" ,
                          "kun" => "カン, kan" ,
                          "on" => ""  ,
                           "category_id" => 1
                        },
                           {
                          "text" => "効" ,
                          "mean" => "effect" ,
                          "other_mean" => "" ,
                          "kun" => "コウ, kō" ,
                          "on" => "き-く, ki-ku"  ,
                           "category_id" => 1
                        },
                           {
                          "text" => "本" ,
                          "mean" => "book" ,
                          "other_mean" => "" ,
                          "kun" => "ホン, hon" ,
                          "on" => "もと, moto"  ,
                           "category_id" => 1
                        },
                           {
                          "text" => "画" ,
                          "mean" => "tableau" ,
                          "other_mean" => "" ,
                          "kun" => "ガ、カク, ga, kaku" ,
                          "on" => ""  ,
                           "category_id" => 1
                        },
                           {
                          "text" => "推" ,
                          "mean" => "infer" ,
                          "other_mean" => "" ,
                          "kun" => "スイ, sui" ,
                          "on" => "お-す, o-su"  ,
                           "category_id" => 1
                        },
                           {
                          "text" => "映" ,
                          "mean" => "reflect" ,
                          "other_mean" => "" ,
                          "kun" => "エイ, ei" ,
                          "on" => "うつ-る、うつ-す、は-える, utsu-ru, utsu-su, ha-eru"  ,
                           "category_id" => 1
                        },
                         {
                          "text" => "柵" ,
                          "mean" => "fence" ,
                          "other_mean" => "" ,
                          "kun" => "サク、サン, saku, san" ,
                          "on" => "しがら-む、ひがらみ、とりで、やらい, shigara-mu, higarami, toride, yarai"  ,
                           "category_id" => 1
                        },
                        {
                          "text" => "史" ,
                          "mean" => "history" ,
                          "other_mean" => "" ,
                          "kun" => "シ, shi" ,
                          "on" => ""  ,
                           "category_id" => 1
                        },
                        {
                          "text" => "図" ,
                          "mean" => "diagram" ,
                          "other_mean" => "" ,
                          "kun" => "ズ、ト, zu, to" ,
                          "on" => "はか-る, haka-ru"  ,
                           "category_id" => 1
                        },
                        {
                          "text" => "銃" ,
                          "mean" => "gun" ,
                          "other_mean" => "" ,
                          "kun" => " ジュウ, jū" ,
                          "on" => ""  ,
                           "category_id" => 1
                        },
                        {
                          "text" => "鍛" ,
                          "mean" => "forge" ,
                          "other_mean" => "" ,
                          "kun" => "タン, tan" ,
                          "on" => " きた-える, kita-eru"  ,
                           "category_id" => 1
                        },
                        {
                          "text" => "気" ,
                          "mean" => "feeling" ,
                          "other_mean" => "" ,
                          "kun" => " キ、ケ, ki, ke" ,
                          "on" => ""  ,
                           "category_id" => 1
                        },{
                          "text" => "率" ,
                          "mean" => "rate" ,
                          "other_mean" => "" ,
                          "kun" => "ソツ、リツ, sotsu, ritsu" ,
                          "on" => "ひき-いる, hiki-iru"  ,
                           "category_id" => 1
                        },
                        {
                          "text" => "電" ,
                          "mean" => "electricity" ,
                          "other_mean" => "" ,
                          "kun" => " デン, den" ,
                          "on" => ""  ,
                           "category_id" => 1
                        },
                        {
                          "text" => "葬" ,
                          "mean" => "interment" ,
                          "other_mean" => "" ,
                          "kun" => " ソウ, sō" ,
                          "on" => "ほうむ-る, hōmu-ru"  ,
                           "category_id" => 1
                        },
                         {
                          "text" => "存" ,
                          "mean" => "suppose" ,
                          "other_mean" => "" ,
                          "kun" => " ソン、ゾン, son, zon" ,
                          "on" => ""  ,
                           "category_id" => 1
                        },
                        {
                          "text" => "匿" ,
                          "mean" => "hide" ,
                          "other_mean" => "" ,
                          "kun" => "トク, toku" ,
                          "on" => " かくま-う, kakuma-u"  ,
                           "category_id" => 1
                        },
                         {
                          "text" => "協" ,
                          "mean" => "cooperation" ,
                          "other_mean" => "" ,
                          "kun" => " キョウ, kyō" ,
                          "on" => ""  ,
                           "category_id" => 1
                        },
                         {
                          "text" => "地" ,
                          "mean" => "ground" ,
                          "other_mean" => "" ,
                          "kun" => "チ、ジ, chi, ji" ,
                          "on" => ""  ,
                           "category_id" => 1
                        },
                         {
                          "text" => "悪" ,
                          "mean" => "bad" ,
                          "other_mean" => "" ,
                          "kun" => "チ、ジ, chi, ji" ,
                          "on" => ""  ,
                           "category_id" => 1
                        },
                         {
                          "text" => "刷" ,
                          "mean" => "printing" ,
                          "other_mean" => "" ,
                          "kun" => "サツ, satsu" ,
                          "on" => "す-る, su-ru"  ,
                           "category_id" => 1
                        },
                         {
                          "text" => "厄" ,
                          "mean" => "unlucky" ,
                          "other_mean" => "" ,
                          "kun" => "ヤク, yaku" ,
                          "on" => ""  ,
                           "category_id" => 1
                        },
                         {
                          "text" => "思" ,
                          "mean" => "think" ,
                          "other_mean" => "" ,
                          "kun" => "シ, shi" ,
                          "on" => "おも-う, omo-u"  ,
                           "category_id" => 1
                        },
                         {
                          "text" => "衡" ,
                          "mean" => "equilibrium" ,
                          "other_mean" => "" ,
                          "kun" => " コウ, kō" ,
                          "on" => ""  ,
                           "category_id" => 1
                        },
                         {
                          "text" => "六" ,
                          "mean" => "six" ,
                          "other_mean" => "ロク, roku" ,
                          "kun" => " む、む-つ、むっ-つ、むい, mu, mu-tsu, mut-tsu, mui" ,
                          "on" => ""  ,
                           "category_id" => 1
                        },
                         {
                          "text" => "幕" ,
                          "mean" => "curtain" ,
                          "other_mean" => "" ,
                          "kun" => "マク、バク, maku, baku" ,
                          "on" => ""  ,
                           "category_id" => 1
                        },
                         {
                          "text" => "仏" ,
                          "mean" => "Buddha" ,
                          "other_mean" => "" ,
                          "kun" => "ブツ, butsu" ,
                          "on" => "ほとけ, hotoke"  ,
                           "category_id" => 1
                        },
                         {
                          "text" => "項" ,
                          "mean" => "paragraph" ,
                          "other_mean" => "" ,
                          "kun" => "コウ, kō" ,
                          "on" => ""  ,
                           "category_id" => 1
                        },
                         {
                          "text" => "康" ,
                          "mean" => "health" ,
                          "other_mean" => "" ,
                          "kun" => "コウ, kō" ,
                          "on" => ""  ,
                           "category_id" => 1
                        },
                    ]
                    
    kanji_lists.each_with_index do |kanji, index|
       Kanji.seed do |s|
          s.id    = index+1
          s.text = kanji["text"]
          s.mean = kanji["mean"]
          s.other_mean  = kanji["other_mean"]
          s.kun  = kanji["kun"]
          s.on  = kanji["on"]
          s.category_id  = kanji["category_id"]
        end
    end
    
    word_lists = [
                        {
                          "text" => "大きい" ,
                          "mean" => "big" ,
                          "pronounce" => "おおきい" ,
                          "category_id" => 1
                        },
                        {
                          "text" => "映画館" ,
                          "mean" => "movie theatre (theater)" ,
                          "pronounce" => "えいがかん" ,
                          "category_id" => 1
                        },
                         {
                          "text" => "電気" ,
                          "mean" => "electricity" ,
                          "pronounce" => "でんき" ,
                          "category_id" => 1
                        },
                        {
                          "text" => "悪い" ,
                          "mean" => "bad" ,
                          "pronounce" => "わるい" ,
                          "category_id" => 1
                        },
                         {
                          "text" => "幕" ,
                          "mean" => "curtain" ,
                          "pronounce" => "まく" ,
                          "category_id" => 1
                        },
                    ]
                    
    word_lists.each_with_index do |word, index|
       Word.seed do |s|
          s.id    = index+1
          s.text = word["text"]
          s.mean = word["mean"]
          s.pronounce  = word["pronounce"]
          s.category_id  = word["category_id"]
        end
    end
    
    # character_lists = [
    #                     {
    #                       "text" => "大" ,
    #                       "order" => 1,
    #                       "word_id" => 1 ,
    #                       "kanji_id" => 9
    #                     },
    #                 ]
                    
    # character_lists.each_with_index do |character, index|
    #   Character.seed do |s|
    #       s.id    = index+1
    #       s.text = character["text"]
    #       s.order = character["order"]
    #       s.word_id  = character["word_id"]
    #       s.kanji_id  = character["kanji_id"]
    #     end
    # end
    
    # test_lists = [
    #                     {
    #                       "word_id" => 1 ,
    #                     },
    #                 ]
                    
    # test_lists.each_with_index do |test, index|
    #   Test.seed do |s|
    #       s.id    = index+1
    #       s.word_id = test["word_id"]
    #     end
    # end
    
    
    # answer_lists = [
    #                     {
    #                       "test_id" => 1 ,
    #                       "kanji_id" => 1
    #                     },
    #                     {
    #                       "test_id" => 1 ,
    #                       "kanji_id" => 2
    #                     },
    #                     {
    #                       "test_id" => 1 ,
    #                       "kanji_id" => 3
    #                     },
    #                     {
    #                       "test_id" => 1 ,
    #                       "kanji_id" => 4
    #                     },
    #                     {
    #                       "test_id" => 1 ,
    #                       "kanji_id" => 5
    #                     },
    #                     {
    #                       "test_id" => 1 ,
    #                       "kanji_id" => 6
    #                     },
    #                     {
    #                       "test_id" => 1 ,
    #                       "kanji_id" => 7
    #                     },
    #                     {
    #                       "test_id" => 1 ,
    #                       "kanji_id" => 8
    #                     },
    #                      {
    #                       "test_id" => 1 ,
    #                       "kanji_id" => 9
    #                     },
    #                 ]
                    
    # answer_lists.each_with_index do |character, index|
    #   Answer.seed do |s|
    #       s.id    = index+1
    #       s.test_id  = character["test_id"]
    #       s.kanji_id  = character["kanji_id"]
    #     end
    # end