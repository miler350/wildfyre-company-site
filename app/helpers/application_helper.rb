module ApplicationHelper
  
  def abbreviate(string)
    collection = []
    string.split(" ").each do |word|
      collection << word[0].capitalize 
    end
    collection.join
  end
end
