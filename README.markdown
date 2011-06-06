A simple ActiveRecord mapping to the Japanaese Wordnet database.  

You can get the database here:
http://nlpwww.nict.go.jp/wn-ja/index.en.html

Usage:

    require './WordnetJapanActiveRecord/mapping.rb'
    require 'pp'
    
    ActiveRecord::Base.establish_connection(
      :adapter => 'sqlite3', 
      :database => "./wnjpn.db"
    )                                      
    
    Word.find_all_by_lemma("ruby").each {|word| 
      word.senses.each {|sense|
        pp sense.synset
      }
    }

