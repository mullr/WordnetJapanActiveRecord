require 'active_record'

class Sense < ActiveRecord::Base
  set_table_name "sense"
  has_many :synsets
  belongs_to :word,   :primary_key => "wordid", :foreign_key => "wordid"
  belongs_to :synset, :primary_key => "synset", :foreign_key => "synset"
end

class Word < ActiveRecord::Base
  set_table_name "word"
  has_many :senses,   :primary_key => "wordid", :foreign_key => "wordid"
end

class Synset < ActiveRecord::Base
  set_table_name "synset"
  has_many :defs,     :class_name => "SynsetDef", :primary_key => "synset", :foreign_key => "synset"
  has_many :examples, :class_name => "SynsetEx",  :primary_key => "synset", :foreign_key => "synset"
end

class SynsetDef < ActiveRecord::Base
  set_table_name "synset_def"  

  def to_s
    self.def
  end
end

class SynsetEx < ActiveRecord::Base
  set_table_name "synset_ex"

  def to_s
    self.def
  end
end
